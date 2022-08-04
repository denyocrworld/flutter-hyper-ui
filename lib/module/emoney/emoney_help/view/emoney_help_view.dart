import 'package:flutterx/core.dart';
import 'dart:math';


import 'package:flutter/material.dart';




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
                Container(
                  color: Colors.red[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: ExButton(
                          label: "Add",
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("products")
                                .add({
                              "photo":
                                  "https://i.ibb.co/qmcDCRn/2-27310-this-product-design-is-laptop-free-button-about.jpg",
                              "product_name":
                                  "Product ${Random().nextInt(1000)}",
                              "category": "Electronics",
                              "price": Random().nextInt(1000),
                            });
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
