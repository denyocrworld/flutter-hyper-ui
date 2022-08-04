import 'package:flutterx/core.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterx/data/session/app_session.dart';
import 'package:flutterx/module/emoney/emoney_tutorial_form/view/emoney_tutorial_form_view.dart';

class EmoneyHelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyHelpController>(
      init: EmoneyHelpController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("Tutorial"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: Colors.red[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: ExButton(
                          label: "Add",
                          onPressed: () {
                            Get.to(EmoneyTutorialFormView());
                          },
                        ),
                      ),
                      Expanded(
                        child: ExButton(
                          label: "Delete All",
                          onPressed: () async {
                            var snapshot = await FirebaseFirestore.instance
                                .collection("products")
                                .get();
                            for (var doc in snapshot.docs) {
                              FirebaseFirestore.instance
                                  .collection("products")
                                  .doc(doc.id)
                                  .delete();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                StreamBuilder<DocumentSnapshot<Object?>>(
                  stream: userCollection.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text("Error");
                    if (!snapshot.hasData) return Text("No Data");
                    Map item = (snapshot.data!.data() as Map);

                    return Text(
                      "\$${item["balance"]}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 400.0,
                  color: Colors.green[200],
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("products")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final data = snapshot.requireData;

                      return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          var item = (data.docs[index].data() as Map);
                          return InkWell(
                            onTap: () {
                              FirebaseFirestore.instance
                                  .collection("products")
                                  .doc(data.docs[index].id)
                                  .delete();
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(item["product_name"]),
                                subtitle: Text(item["category"]),
                                trailing: InkWell(
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection("products")
                                        .doc(data.docs[index].id)
                                        .update({
                                      "price": FieldValue.increment(10),
                                    });
                                  },
                                  child: Text("\$${item["price"]}"),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
