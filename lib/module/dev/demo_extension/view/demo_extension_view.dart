import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import '../controller/demo_extension_controller.dart';

import 'package:get/get.dart';

class DemoExtensionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoExtensionController>(
      init: DemoExtensionController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text("Demo Extension"),
            actions: [
              InkWell(
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection("demo_users")
                      .add({
                    "name": "User ${Random().nextInt(1000)}",
                    "title": "Programmer",
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Add"),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("demo_users")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return Text("Error");
                      if (!snapshot.hasData) return Text("No Data");
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          var item = (data.docs[index].data() as Map);

                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  "https://i.ibb.co/QrTHd59/woman.jpg",
                                ),
                              ),
                              title: Text("${item["name"]}"),
                              subtitle: Text("${item["title"]}"),
                            ),
                          );
                        },
                      );
                    },
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
