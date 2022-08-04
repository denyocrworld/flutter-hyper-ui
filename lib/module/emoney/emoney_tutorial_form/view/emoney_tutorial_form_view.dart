import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';
import '../controller/emoney_tutorial_form_controller.dart';

class EmoneyTutorialFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmoneyTutorialFormController>(
      init: EmoneyTutorialFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("EmoneyTutorialForm"),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "Hello World",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "FUGI",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "2022",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/QrTHd59/woman.jpg",
                        ),
                      ),
                      title: Text("Jessica Doe"),
                      subtitle: Text("Programmer"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/xgwkhVb/740922.png",
                        ),
                      ),
                      title: Text("Apple"),
                      subtitle: Text("\$15"),
                      trailing: Container(
                        width: 120.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              color: Colors.grey[800],
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.grey[800],
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: Get.width,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Text("Hello"),
                  ),
                  ExImagePicker(
                    id: "photo",
                    label: "Photo",
                  ),
                  ExTextField(
                    id: "product_name",
                    label: "Product Name",
                  ),
                  ExLocationPicker(
                    id: "location",
                    label: "Location",
                  ),
                  ExCombo(
                    id: "category",
                    label: "Category",
                    items: [
                      {
                        "label": "Electronics",
                        "value": "Electronics",
                      },
                      {
                        "label": "Vegetables",
                        "value": "Vegetables",
                      }
                    ],
                  ),
                  ExTextField(
                    id: "price",
                    label: "Price",
                    keyboardType: TextInputType.number,
                  ),
                  ExButton(
                    label: "Save",
                    onPressed: () async {
                      var photo = Input.get("photo");
                      var productName = Input.get("product_name");
                      var category = Input.get("category");
                      var price = Input.get("price");

                      await FirebaseFirestore.instance
                          .collection("products")
                          .add({
                        "photo": photo,
                        "product_name": productName,
                        "category": category,
                        "price": price,
                      });

                      Get.back();
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
