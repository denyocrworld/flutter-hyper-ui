import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';

class EmoneyTopupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyTopupController>(
      init: EmoneyTopupController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.purple[900],
            title: Text("Topup"),
          ),
          bottomNavigationBar: Container(
            height: 90.0,
            padding: EdgeInsets.all(12.0),
            child: ExButton(
              label: "Topup",
              color: Colors.purple[900],
              outline: true,
              onPressed: () => controller.doTopup(),
            ),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.selectedPayment != null)
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 7),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 46,
                    child: ListView.builder(
                      itemCount: controller.amounts.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = controller.amounts[index];
                        var selected = controller.selectedAmount == item;

                        return InkWell(
                          onTap: () {
                            if (controller.selectedAmount == item) {
                              controller.selectedAmount = null;
                            } else {
                              controller.selectedAmount = item;
                            }
                            controller.update();
                          },
                          child: Card(
                            color: selected ? Colors.grey[600] : Colors.white,
                            child: Container(
                              width: 60.0,
                              child: Center(
                                child: Text(
                                  "\$${item["amount"]}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: selected
                                        ? Colors.white
                                        : Colors.grey[900],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: Container(
                      height: Get.height / 2,
                      child: ListView.builder(
                        itemCount: controller.paymentMethods.length,
                        itemBuilder: (context, index) {
                          var item = controller.paymentMethods[index];
                          var selected = controller.selectedPayment == item;

                          return InkWell(
                            onTap: () {
                              if (controller.selectedPayment == item) {
                                controller.selectedPayment = null;
                              } else {
                                controller.selectedPayment = item;
                              }
                              controller.update();
                            },
                            child: Card(
                              child: Container(
                                width: 140.0,
                                child: ListTile(
                                  leading: Image.network(
                                    item["photo"],
                                    width: 40.0,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  title: Text(
                                    item["payment_name"],
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    item["type"],
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  trailing: selected
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
