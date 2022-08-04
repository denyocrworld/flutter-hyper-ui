import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';

import '../../../dev/dev_secret_home/view/dev_secret_home_view.dart';
import '../controller/social_media_login_controller.dart';



class SocialMediaLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialMediaLoginController>(
      init: SocialMediaLoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://i.ibb.co/6rzg7FZ/photo-1523898052899-241108586cf8-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: GlassContainer(
                    blur: 10,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Wrap(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(DevSecretHomeView());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                child: ImageIcon(
                                  NetworkImage(
                                    "https://i.ibb.co/KFHGw5C/2763368.png",
                                  ),
                                  color: Colors.white,
                                  size: 60.0,
                                ),
                              ),
                            ),
                          ),
                          ExTextField(
                            id: "email",
                            label: "Email",
                            hintText: "Enter username",
                            value: "userx@demo.com",
                            style: 2,
                          ),
                          ExTextField(
                            id: "password",
                            label: "Password",
                            hintText: "Password",
                            value: "123456",
                            textFieldType: TextFieldType.password,
                            style: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Spacer(),
                                Text(
                                  "Recovery password",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ExButton(
                            label: "Sign in",
                            color: Colors.deepOrange[900],
                            borderRadius: 10.0,
                            onPressed: () => controller.doLogin(),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                "Or",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.google,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Icon(
                                MdiIcons.facebook,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Icon(
                                MdiIcons.microsoft,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
