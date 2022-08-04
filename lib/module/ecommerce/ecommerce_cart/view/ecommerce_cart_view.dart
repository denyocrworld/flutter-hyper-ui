import 'package:flutter/material.dart';
import '../controller/ecommerce_cart_controller.dart';

import 'package:get/get.dart';

class EcommerceCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EcommerceCartController>(
      init: EcommerceCartController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("EcommerceCart"),
          ),
          body: Container(
            child: Row(
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "World",
                  style: TextStyle(
                    fontSize: 20,
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
