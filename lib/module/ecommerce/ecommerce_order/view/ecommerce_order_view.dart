import 'package:flutter/material.dart';
import '../controller/ecommerce_order_controller.dart';

import 'package:get/get.dart';

class EcommerceOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EcommerceOrderController>(
      init: EcommerceOrderController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("EcommerceOrder"),
          ),
        );
      },
    );
  }
}