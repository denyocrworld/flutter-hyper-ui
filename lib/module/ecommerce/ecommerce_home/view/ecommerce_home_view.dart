import 'package:flutter/material.dart';
import '../controller/ecommerce_home_controller.dart';

import 'package:get/get.dart';

class EcommerceHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EcommerceHomeController>(
      init: EcommerceHomeController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("EcommerceHome"),
          ),
        );
      },
    );
  }
}