import 'package:flutter/material.dart';
import '../controller/dev_about_controller.dart';

import 'package:get/get.dart';

class DevAboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevAboutController>(
      init: DevAboutController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("DevAbout"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  """
Flutter Hyper UI Kit contains a collection of UI Kits that are useful for creating Forms in Flutter.
Currently, our focus is only on creating Forms. But it is possible that we will also make other ui.
"""
                      .trim(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "capekngoding.com",
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
