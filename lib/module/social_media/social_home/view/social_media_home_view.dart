import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/core.dart';

import 'package:flutterx/module/social_media/social_home/controller/social_media_home_controller.dart';
import 'package:flutterx/module/social_media/social_home/widget/bubble_story.dart';
import 'package:flutterx/module/social_media/social_media_login/view/social_media_login_view.dart';
import 'package:flutterx/module/social_media/social_media_new_post/view/social_media_new_post_view.dart';

import '../widget/user_post.dart';

class SocialMediaHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialMediaHomeController>(
      init: SocialMediaHomeController(),
      builder: (controller) {
        controller.view = this;
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            leadingWidth: 0.0,
            title: SvgPicture.asset(
              'assets/icon/ic_logo.svg',
              color: Colors.grey[900],
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              InkWell(
                onTap: () {
                  Get.to(SocialMediaNewPostView());
                },
                child: SvgPicture.asset(
                  'assets/icon/ic_add.svg',
                  color: Colors.grey[900],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  'assets/icon/ic_favorite.svg',
                  color: Colors.grey[900],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  'assets/icon/ic_send.svg',
                  color: Colors.grey[900],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.off(SocialMediaLoginView());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    MdiIcons.power,
                    color: Colors.grey[900],
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return BubbleStory(
                      name: controller.users[index],
                      isMe: index == 0 ? true : false,
                      isLive: index == 1 ? true : false,
                    );
                  },
                  itemCount: controller.users.length,
                ),
              ),
              const Divider(
                height: 1,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("posts")
                      .orderBy("created_at", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text("Error");
                    if (!snapshot.hasData) return Text("No Data");
                    final data = snapshot.data!;

                    print(data);
                    print("--");

                    return ListView.builder(
                      itemCount: data.docs.length,
                      itemBuilder: (context, index) {
                        var item = (data.docs[index].data() as Map);

                        return UserPost(
                          item: item,
                        );
                      },
                    );
                  },
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemBuilder: (context, index) {
              //       return UserPost(
              //         content: controller.listContent[index],
              //       );
              //     },
              //     itemCount: controller.listContent.length,
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
