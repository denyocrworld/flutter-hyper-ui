import 'package:flutter/material.dart';
import '../controller/dev_dashboard_controller.dart';

import 'package:get/get.dart';

class DevDashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevDashboardController>(
      init: DevDashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("DevDashboard"),
          ),
        );
      },
    );
  }
}