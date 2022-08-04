import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import 'package:flutterx/module/dev/dev_secret_home/view/dev_secret_home_view.dart';

class EmoneyLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyLoginController>(
      init: EmoneyLoginController(),
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
                      "https://img.freepik.com/premium-photo/pastel-tone-purple-pink-blue-gradient-defocused-abstract-photo-smooth-lines-pantone-color-background_49683-4059.jpg?w=1060",
                    ),
                    fit: BoxFit.fill,
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
                                    "https://i.ibb.co/rbcD599/1500066.png",
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
