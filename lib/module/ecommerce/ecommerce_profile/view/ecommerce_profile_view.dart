import 'package:flutter/material.dart';
import '../controller/ecommerce_profile_controller.dart';

import 'package:get/get.dart';

class EcommerceProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EcommerceProfileController>(
      init: EcommerceProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("EcommerceProfile"),
          ),
        );
      },
    );
  }
}