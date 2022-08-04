import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';

import '../widget/profile_item.dart';
import '../widget/shadow_card.dart';

class EmoneyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyProfileController>(
      init: EmoneyProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Color(0xffF3F5F9),
          appBar: AppBar(
            backgroundColor: Colors.purple[900],
            iconTheme: IconThemeData(
              color: Colors.grey[900],
            ),
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
              child: ClipOval(
                child: Material(
                  color: Colors.purple.withOpacity(0.6),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/icon/icon_calendar.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
            title: Text("Profile"),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                child: ClipOval(
                  child: Material(
                    color: Colors.purple.withOpacity(0.6),
                    child: InkWell(
                      onTap: () {
                        Get.off(EmoneyLoginView());
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Icon(
                          Icons.logout_outlined,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  ShadowCard(
                    border: 124 / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 42.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/tXncffL/photo-1487017159836-4e23ece2e4cf-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Marjorie Hawkins',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Color(0xff34C759),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              top: 4.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              "Class: 7B",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Card(
                          color: Color(0xffAF52DE),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              top: 4.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              "Profile: Maths, Physics",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ShadowCard(
                    border: 16,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Information",
                            style: TextStyle(
                              color: Color(0xff3C3C43).withOpacity(0.6),
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Column(
                            children: controller.card1.map(
                              (e) {
                                return ProfileItem(
                                  color: e['color'],
                                  icon: e['icon'],
                                  name: e['name'],
                                  subname: e['subname'],
                                );
                              },
                            ).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ShadowCard(
                    border: 16,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "School Life",
                            style: TextStyle(
                              color: Color(0xff3C3C43).withOpacity(0.6),
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Column(
                            children: controller.card2.map(
                              (e) {
                                return ProfileItem(
                                  color: e['color'],
                                  icon: e['icon'],
                                  name: e['name'],
                                  subname: e['subname'],
                                );
                              },
                            ).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
