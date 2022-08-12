import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TemplateDashboardGroceryView extends StatelessWidget {
  const TemplateDashboardGroceryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#TEMPLATE ui_dashboard_grocery
    /*
    ------------------------
    https://capekngoding.com
    ------------------------
    Name: Deny Ocr
    Website: https://www.youtube.com/c/CapekNgoding
    Email: denyocr.world@gmail.com
    Subscribe please XD hehehe
    ------------------------
    [1] Update pubspec.yaml
    material_design_icons_flutter:

    [2] Import
    import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
    ------------------------
    Code generation with snippets can be a good solution for you or it can kill you.
    A basic understanding of Dart and Flutter is required.
     Keep it in mind, Our snippet can't generate many files yet. 
    So, all of our snippets are put in one file which is not best practice.
    You need to do the optimization yourself, and at least you are familiar with using Flutter.
    ------------------------
    */

    List categories = [
      "All",
      "Fruit",
      "Vegetable",
      "Meat",
      "Diary",
    ];

    List products = [
      {
        "product_name": "Orange Fruit",
        "photo_url":
            "https://i.ibb.co/TL1zzkQ/orange-png-transparent-images-download-clip-art-4.png",
        "price": 16.23,
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      },
      {
        "product_name": "Brocoli",
        "photo_url":
            "https://i.ibb.co/GW4Cy4t/download-broccoli-png-image-with-transparent-background-png-image-pngimg-13.png",
        "price": 25.23,
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      },
      {
        "product_name": "Mango Fruit",
        "photo_url": "https://i.ibb.co/SyhZzkt/comhiclipartdskou.jpg",
        "price": 40.00,
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      },
      {
        "product_name": "Apple",
        "photo_url":
            "https://i.ibb.co/rmX5rCL/apple-transparent-fruit-clipart-7.png",
        "price": 33.11,
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      },
      {
        "product_name": "Jack Fruit",
        "photo_url":
            "https://i.ibb.co/pzXLDTV/jackfruit-11524346941tduxxqednw.png",
        "price": 24.22,
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      },
    ];

    int selectedCategoryIndex = 0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: Container(),
        leadingWidth: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[900],
        ),
        titleTextStyle: TextStyle(
          color: Colors.grey[900],
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome bro!",
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Let's relax and buy something!",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.ibb.co/PGv8ZzG/me.jpg",
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey[200]!,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: Colors.grey[400]!,
                            ),
                            icon: Icon(
                              Icons.search,
                              color: Colors.green[300]!,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (text) {},
                          onSubmitted: (text) {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Card(
                      color: Colors.green[50],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.tune,
                          color: Colors.green[200],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 45.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = categories[index];
                      bool selected = selectedCategoryIndex == index;
                      return InkWell(
                        onTap: () {
                          //-----------
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "$item",
                                style: TextStyle(
                                  color: selected
                                      ? Colors.green[300]
                                      : Colors.grey[400],
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              if (selected)
                                Icon(
                                  Icons.circle,
                                  color: Colors.green[300],
                                  size: 4.0,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 190.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = products[index];
                      return InkWell(
                        onTap: () {
                          //---
                        },
                        child: Container(
                          width: 120.0,
                          height: 200.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    item["photo_url"],
                                    width: 120.0,
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item["product_name"]}",
                                        style: TextStyle(
                                          color: Colors.blueGrey[900],
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${item["product_name"]}",
                                        style: TextStyle(
                                          color: Colors.blueGrey[300],
                                          fontSize: 8.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(
                                    "\$${item["price"]}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[300],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.orange[400],
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12.0),
                                          bottomLeft: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: const Icon(
                                        MdiIcons.shopping,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Recent Shop",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: List.generate(
                      products.length,
                      (index) {
                        var item = products[index];
                        return InkWell(
                          onTap: () {
                            //---
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  item["photo_url"],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item["product_name"]}",
                                        style: TextStyle(
                                          color: Colors.blueGrey[900],
                                        ),
                                      ),
                                      Text(
                                        "${item["product_name"]}",
                                        style: TextStyle(
                                          color: Colors.blueGrey[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  "\$${item["price"]}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[300],
                                  ),
                                ),
                              ],
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
      ),
    );
    //#END
  }
}
