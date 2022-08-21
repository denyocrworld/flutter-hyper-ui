import 'package:flutter/material.dart';

class TemplateProfileBasicView extends StatelessWidget {
  const TemplateProfileBasicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#TEMPLATE ui_profile_basic
    /*
    ------------------------
    https://capekngoding.com
    ------------------------
    Starring:
    Name: Dicky Darmawan
    Github: https://github.com/Dicky019
    ------------------------
    -
    ------------------------
    Code generation with snippets can be a good solution for you or it can kill you.
    A basic understanding of Dart and Flutter is required.
     Keep it in mind, Our snippet can't generate many files yet. 
    So, all of our snippets are put in one file which is not best practice.
    You need to do the optimization yourself, and at least you are familiar with using Flutter.
    ------------------------
    */

    List<Map<String, dynamic>> card1 = [
      {
        'name': 'Marks',
        'subname': 'Average: 8.9',
        'color': const Color(0xffFF9500),
        'icon':
            'https://capekngoding.com/uploads/62f5f1157da6a_icon_thumup.png',
      },
      {
        'name': 'Debts',
        'subname': 'None',
        'color': const Color(0xffFF3B30),
        'icon': 'https://capekngoding.com/uploads/62f5f112a318c_icon_fire.png',
      },
      {
        'name': 'History',
        'subname': '',
        'color': const Color(0xff34C759),
        'icon': 'https://capekngoding.com/uploads/62f5f116098a3_icon_time.png',
      },
    ];

    List<Map<String, dynamic>> card2 = [
      {
        'name': 'News',
        'subname': '',
        'color': const Color(0xff546CF6),
        'icon':
            'https://capekngoding.com/uploads/62f5f1118bc84_icon_compas.png',
      },
      {
        'name': 'Teachers',
        'subname': '',
        'color': const Color(0xff546CF6),
        'icon':
            'https://capekngoding.com/uploads/62f5f11340f58_icon_peoples.png',
      },
      {
        'name': 'Rools',
        'subname': '',
        'color': const Color(0xff546CF6),
        'icon':
            'https://capekngoding.com/uploads/62f5f114ec843_icon_shield.png',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[900],
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
          child: ClipOval(
            child: Material(
              color: const Color(0xffFF9500).withOpacity(0.24),
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Image.network(
                    'https://capekngoding.com/uploads/62f5f110e0318_icon_calendar.png',
                  ),
                ),
              ),
            ),
          ),
        ),
        titleTextStyle: TextStyle(
          color: Colors.grey[900],
        ),
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
            child: ClipOval(
              child: Material(
                color: const Color(0xffFF9500).withOpacity(0.24),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Image.network(
                      'https://capekngoding.com/uploads/62f5f113bb266_icon_setting.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(124 / 2),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        spreadRadius: 8)
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 42.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/tXncffL/photo-1487017159836-4e23ece2e4cf-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Marjorie Hawkins',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Card(
                      color: Color(0xff34C759),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          "Class: 7B",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Card(
                      color: Color(0xffAF52DE),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          "Profile: Maths, Physics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        spreadRadius: 8)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Information",
                        style: TextStyle(
                          color: const Color(0xff3C3C43).withOpacity(0.6),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Column(
                        children: card1.map(
                          (e) {
                            return SizedBox(
                              height: 50,
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 28,
                                            width: 28,
                                            padding: const EdgeInsets.all(5.5),
                                            decoration: BoxDecoration(
                                              color: e['color'],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Image.network(e['icon'])),
                                        const SizedBox(width: 16),
                                        Text(
                                          e['name'],
                                          style: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          e['subname'],
                                          style: TextStyle(
                                            color: const Color(0xff3C3C43)
                                                .withOpacity(0.6),
                                            fontSize: 17,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        const Icon(
                                          Icons.chevron_right,
                                          size: 24,
                                          color: Color(0xffD1D1D6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        spreadRadius: 8)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "School Life",
                        style: TextStyle(
                          color: const Color(0xff3C3C43).withOpacity(0.6),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Column(
                        children: card2.map(
                          (e) {
                            // return EmoneyProfileItem(
                            //   color: e['color'],
                            //   icon: e['icon'],
                            //   name: e['name'],
                            //   subname: e['subname'],
                            // );

                            return SizedBox(
                              height: 50,
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 28,
                                            width: 28,
                                            padding: const EdgeInsets.all(5.5),
                                            decoration: BoxDecoration(
                                              color: e["color"],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Image.network(e["icon"])),
                                        const SizedBox(width: 16),
                                        Text(
                                          e["name"],
                                          style: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          e["subname"],
                                          style: TextStyle(
                                            color: const Color(0xff3C3C43)
                                                .withOpacity(0.6),
                                            fontSize: 17,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        const Icon(
                                          Icons.chevron_right,
                                          size: 24,
                                          color: Color(0xffD1D1D6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
    //#END
  }
}
