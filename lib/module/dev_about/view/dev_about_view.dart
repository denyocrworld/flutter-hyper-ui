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
        );
      },
    );
  }
}