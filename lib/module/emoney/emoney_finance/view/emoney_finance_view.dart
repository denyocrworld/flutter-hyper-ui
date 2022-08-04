import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';




class EmoneyFinanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyFinanceController>(
      init: EmoneyFinanceController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.purple[900],
            leading: Container(),
            leadingWidth: 0.0,
            title: Text("Finance"),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ...List.generate(
                    controller.investationList.length,
                    (index) {
                      var item = controller.investationList[index];
                      return Container(
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.only(
                          bottom: 20.0,
                        ),
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  MdiIcons.chartBar,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  item["company_name"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Card(
                                  color: Colors.red,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 4.0,
                                      bottom: 4.0,
                                    ),
                                    child: Text(
                                      "New",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Text(
                              item["description"],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "Powered by ",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "${item["powered_by"]}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Card(
                                  color: Colors.purple[900],
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Text(
                                      "Invest",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
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
