import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';




class EmoneyActivityHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyActivityHistoryController>(
      init: EmoneyActivityHistoryController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.purple[900],
            title: Text("Activity History"),
          ),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    if (index % 4 == 0)
                      Container(
                        color: Colors.grey[300],
                        padding: EdgeInsets.all(12.0),
                        width: Get.width,
                        child: Text(
                          "${index + 1} May 2022",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      width: Get.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (index % 3 == 0)
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 8.0,
                              child: Icon(
                                MdiIcons.check,
                                color: Colors.white,
                                size: 14.0,
                              ),
                            ),
                          if (index % 3 != 0)
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 8.0,
                              child: Icon(
                                MdiIcons.close,
                                color: Colors.white,
                                size: 14.0,
                              ),
                            ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your transfer to Faisal Ramdan Mulyadi is ${index % 3 != 0 ? "Failed" : "Success"}",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 10.0,
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "\$${Random().nextInt(999)}",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
