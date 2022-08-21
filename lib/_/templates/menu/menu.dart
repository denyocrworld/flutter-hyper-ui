import 'dart:developer';

import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text("Menu"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //#TEMPLATE menu_basic
              Builder(
                builder: (context) {
                  List menus = [
                    {
                      "icon": Icons.abc,
                      "label": "Home",
                      "onTap": () {
                        log("Test!");
                      },
                    },
                    {
                      "icon": Icons.tiktok,
                      "label": "Tiktok",
                      "onTap": () {},
                    },
                    {
                      "icon": Icons.facebook,
                      "label": "Facebook",
                      "onTap": () {},
                    },
                    {
                      "icon": Icons.access_alarm,
                      "label": "Task Scheduler",
                      "onTap": () {},
                    },
                    {
                      "icon": Icons.developer_board,
                      "label": "Developer",
                      "onTap": () {},
                    },
                    {
                      "icon": Icons.web,
                      "label": "Website",
                      "onTap": () {},
                    },
                    {
                      "icon": Icons.mobile_screen_share_rounded,
                      "label": "Share",
                      "onTap": () {},
                    },
                    {
                      "icon": Icons.event,
                      "label": "Event",
                      "onTap": () {},
                    },
                  ];

                  return Wrap(
                    runSpacing: 20.0,
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];

                        var size = (MediaQuery.of(context).size.width - 40) / 4;
                        return InkWell(
                          onTap: () => item["onTap"](),
                          child: SizedBox(
                            width: size,
                            child: Column(
                              children: [
                                Icon(
                                  item["icon"],
                                  color: Colors.blueGrey,
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "${item["label"]}",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE list_image_gallery
              Builder(
                builder: (context) {
                  List menus = [
                    {
                      "photo":
                          "https://i.ibb.co/rcDzK4T/photo-1605538293913-13cfc720511e-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {
                        log("Test!");
                      },
                    },
                    {
                      "photo":
                          "https://i.ibb.co/TDyK1km/photo-1593807980339-b3fad3472c45-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/k3T7YBz/photo-1610320819784-58ccf5531a3f-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/0mS4w5t/photo-1576750168278-747aebbb30c3-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/jDfJNM0/photo-1587897500679-a5962dc49c67-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/MVYZL7Q/photo-1581906848371-59968ebb7052-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/TmmxC61/photo-1605604904594-b640971ce3cb-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/ck5p8Rx/photo-1594235372071-6734d85514ea-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                  ];

                  return Wrap(
                    runSpacing: 20.0,
                    spacing: 10.0,
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];

                        var size = (MediaQuery.of(context).size.width - 80) / 4;
                        return InkWell(
                          onTap: () => item["onTap"](),
                          child: Container(
                            height: size,
                            width: size,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  item["photo"],
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              //#END
            ],
          ),
        ),
      ),
    );
  }
}
