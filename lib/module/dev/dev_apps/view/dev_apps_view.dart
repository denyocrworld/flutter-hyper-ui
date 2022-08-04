import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import 'package:flutterx/module/social_media/social_media_login/view/social_media_login_view.dart';
import '../controller/dev_apps_controller.dart';

class DevAppsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevAppsController>(
      init: DevAppsController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Container(),
            leadingWidth: 0.0,
            title: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://i.ibb.co/s6HhQnT/image.png",
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
              ],
            ),
            elevation: 0.4,
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Appss",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(EmoneyLoginView());
                          },
                          child: Card(
                            color: Colors.purple[900],
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Center(
                                child: Text(
                                  "EMoney App",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(SocialMediaLoginView());
                          },
                          child: Card(
                            color: Colors.grey[800],
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Center(
                                child: Text(
                                  "Social Media App",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Special Credit",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: ListView.builder(
                      itemCount: controller.contributors.length,
                      itemBuilder: (context, index) {
                        var item = controller.contributors[index];
                        return Container(
                          padding: EdgeInsets.only(
                            left: 12.0,
                            right: 12.0,
                          ),
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: Card(
                            color: Colors.blue[900 - index * 100],
                            child: ListTile(
                              title: Text(
                                item["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(),
                                  Text(
                                    item["email"],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    item["as"],
                                    style: TextStyle(
                                      color: Colors.yellow[400],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
