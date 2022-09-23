import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/dashboard_controller.dart';

import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 24.0,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //body
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[400]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: null,
                            decoration: const InputDecoration.collapsed(
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: "Search",
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    height: 160.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20.0,
                          top: 0.0,
                          bottom: 0.0,
                          child: SizedBox(
                            width: 100.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "30%",
                                  style: GoogleFonts.oswald(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Discount Only Valid for Today",
                                  style: GoogleFonts.oswald(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  LayoutBuilder(
                    builder: (context, constraint) {
                      List menus = [
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/878/878052.png",
                          "label": "Burger",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/3595/3595455.png",
                          "label": "Pizza",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/2718/2718224.png",
                          "label": "Noodles",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/8060/8060549.png",
                          "label": "Meat",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/454/454570.png",
                          "label": "Soup",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/2965/2965567.png",
                          "label": "Dessert",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/2769/2769608.png",
                          "label": "Drink",
                          "onTap": () {},
                        },
                        {
                          "icon":
                              "https://cdn-icons-png.flaticon.com/128/1037/1037855.png",
                          "label": "Others",
                          "onTap": () {},
                        },
                      ];

                      return Wrap(
                        children: List.generate(
                          menus.length,
                          (index) {
                            var item = menus[index];

                            var size = constraint.biggest.width / 4;

                            return SizedBox(
                              width: size,
                              height: size,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  animationDuration:
                                      const Duration(milliseconds: 1000),
                                  onPrimary: Colors.blueGrey,
                                  primary: Colors.transparent,
                                  splashFactory: InkSplash.splashFactory,
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                ),
                                onPressed: () => item["onTap"](),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      item["icon"],
                                      width: 30.0,
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      "${item["label"]}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 11.0,
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
                  const SizedBox(
                    height: 12.0,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Our Products",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  SizedBox(
                    height: 140.0,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 140,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            color: Colors.blue[400],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green[800],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      12.0,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "PROMO",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: const Text(
                                    "Avocado and Eeg Toast",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
