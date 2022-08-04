import 'package:flutter/material.dart';
import '../controller/ecommerce_main_navigation_controller.dart';

import 'package:get/get.dart';

class EcommerceMainNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EcommerceMainNavigationController>(
      init: EcommerceMainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("EcommerceMainNavigation"),
          ),
        );
      },
    );
  }
}