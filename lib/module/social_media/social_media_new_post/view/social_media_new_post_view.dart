import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import '../controller/social_media_new_post_controller.dart';



class SocialMediaNewPostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialMediaNewPostController>(
      init: SocialMediaNewPostController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: Text("New Post"),
            actions: [
              ExButton(
                label: "Post",
                color: warningColor,
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ExImagePicker(
                            id: "photo",
                            label: "Photo",
                          ),
                          ExTextArea(
                            id: "description",
                            label: "Description",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
