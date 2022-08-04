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
                Expanded(
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "World",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
