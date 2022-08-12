import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardTravelView extends StatelessWidget {
  const DashboardTravelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    Starring:
    Name: Aldi.M.Alpaujan
    Email: aldi.m.alpaujan.2@gmail.com
    Github: https://github.com/AldiAlpaujan
    */
    List<Map<String, dynamic>> popularNearby = [
      {
        "place": "Ubud Villa",
        "location": "Bali, Indonesia",
        "imgPic":
            "https://www.ubudvillasrental.com/wp-content/uploads/2019/02/01-Ubud-Villas-Rental-Villa-Bayad-Header.jpg",
      },
      {
        "place": "Nusa Penida Beach",
        "location": "Bali, Indonesia",
        "imgPic":
            "https://www.olaolalombok.com/wp-content/uploads/2017/06/atuh-beach-nusa-penida-03947.jpg",
      },
      {
        "place": "Kuta Beach",
        "location": "Bali, Indonesia",
        "imgPic":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Kuta_Beach_%286924448550%29.jpg/1200px-Kuta_Beach_%286924448550%29.jpg",
      }
    ];

    List<Map<String, String>> recomendation = [
      {
        "place": "Kuta Beach",
        "location": "Bali, Indonesia",
        "imgPic":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Kuta_Beach_%286924448550%29.jpg/1200px-Kuta_Beach_%286924448550%29.jpg",
      },
      {
        "place": "Ubud Villa",
        "location": "Bali, Indonesia",
        "imgPic":
            "https://www.ubudvillasrental.com/wp-content/uploads/2019/02/01-Ubud-Villas-Rental-Villa-Bayad-Header.jpg",
      },
      {
        "place": "Nusa Penida Beach",
        "location": "Bali, Indonesia",
        "imgPic":
            "https://www.olaolalombok.com/wp-content/uploads/2017/06/atuh-beach-nusa-penida-03947.jpg",
      },
    ];

    List menus = [
      {
        "icon": "https://i.ibb.co/9HgyMh6/3658538.png",
        "label": "Holiday",
      },
      {
        "icon": "https://i.ibb.co/Pt09Sdz/2942962.png",
        "label": "Ticket",
      },
      {
        "icon": "https://i.ibb.co/RcMMhBr/3009489.png",
        "label": "Hotels",
      },
      {
        "icon": "https://i.ibb.co/w0K3vY6/5996290.png",
        "label": "More",
      }
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //Header
              //
              Container(
                width: double.infinity,
                height: 80,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            //
                            //User Photo
                            //
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            )),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          //Lokasi User
                          //
                          Text(
                            "Hi,Brooklyn",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 14),
                          ),
                          Row(
                            children: const [
                              Icon(MdiIcons.mapMarker, size: 15),
                              Text(
                                "Jakarta, Indonesia",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      //
                      //Badge Notifikasi
                      //
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Container()),
                          );
                        },
                        child: SizedBox(
                          width: 32.0,
                          child: Badge(
                            badgeContent: const Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                            child: const Icon(
                              MdiIcons.chat,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Container()),
                          );
                        },
                        child: SizedBox(
                          width: 32.0,
                          child: Badge(
                            badgeContent: const Text(
                              "4",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                            child: const Icon(
                              MdiIcons.bell,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              //
              //Textfromfield Search
              //
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: const Icon(MdiIcons.magnify),
                    suffixIcon: const Icon(MdiIcons.tuneVariant),
                    hintText: "Search Places...",
                  ),
                ),
              ),
              //
              //Card suggest
              //
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  menus.length,
                  (index) {
                    var item = menus[index];
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.network(item["icon"]),
                              ),
                              Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(60),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(item["label"]),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              //
              //Card Popular Nearby
              //
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular Nearby",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: popularNearby
                            .map(
                              (item) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: IntrinsicHeight(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  item["imgPic"],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Container(
                                                      height: 30,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[400],
                                                      ),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                                sigmaX: 10.0,
                                                                sigmaY: 10.0),
                                                        child: const Center(
                                                          child: Text(
                                                            "20% off",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Image.network(
                                                                "https://capekngoding.com/uploads/62f5f10be245a_heart.png")),
                                                        Material(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          color: Colors
                                                              .transparent,
                                                          child: InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            onTap: () {},
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // const SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 12.0, 12.0, 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Icon(
                                                  MdiIcons.star,
                                                  color: Colors.amber,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "4.4",
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "(532)",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 0, 12.0, 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item["place"],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                const Icon(
                                                  MdiIcons.mapMarker,
                                                  size: 15,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  item["location"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: const [
                                                Text(
                                                  "\$248 ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "\$299",
                                                  style: TextStyle(
                                                    color: Colors.pink,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //Card Recomendation
              //
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recomendation",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "See More",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: recomendation
                            .map(
                              (e) => SizedBox(
                                width: 300,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.cyan,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  e["imgPic"]!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e["place"]!,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      MdiIcons.mapMarker,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(
                                                      e["location"]!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
