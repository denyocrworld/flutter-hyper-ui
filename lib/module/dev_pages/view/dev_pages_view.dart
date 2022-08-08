import 'package:flutter/material.dart';
import '../controller/dev_pages_controller.dart';

import 'package:get/get.dart';

class DevPagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevPagesController>(
      init: DevPagesController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("DevPages"),
          ),
        );
      },
    );
  }
}