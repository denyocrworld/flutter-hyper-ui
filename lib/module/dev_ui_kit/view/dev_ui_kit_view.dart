import 'package:flutter/material.dart';
import '../controller/dev_ui_kit_controller.dart';

import 'package:get/get.dart';

class DevUiKitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevUiKitController>(
      init: DevUiKitController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("DevUiKit"),
          ),
        );
      },
    );
  }
}