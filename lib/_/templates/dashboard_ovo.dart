import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TemplateDashboardOvoView extends StatelessWidget {
  const TemplateDashboardOvoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#TEMPLATE ui_dashboard_ovo
    /*
    ------------------------
    https://capekngoding.com
    ------------------------
    Starring:
    Name: Danu Septian
    Email: danuseptian1996@gmail.com
    Website: danuseptian.com
    ------------------------
    [1] Update pubspec.yaml
    flutter_custom_clippers:

    [2] Import
    import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
    ------------------------
    Code generation with snippets can be a good solution for you or it can kill you.
    A basic understanding of Dart and Flutter is required.
     Keep it in mind, Our snippet can't generate many files yet. 
    So, all of our snippets are put in one file which is not best practice.
    You need to do the optimization yourself, and at least you are familiar with using Flutter.
    ------------------------
    */

    List<Map> categories = [
      {
        'icon':
            'https://capekngoding.com/uploads/62f5f1198d7d4_purchase-credit.png',
        'title': 'Purchase Credit',
      },
      {
        'icon':
            'https://capekngoding.com/uploads/62f5f117d11bc_mobile-data.png',
        'title': 'Mobile Data',
      },
      {
        'icon':
            'https://capekngoding.com/uploads/62f5f1074141e_electricity.png',
        'title': 'Electricity Bill',
      },
      {
        'icon': 'https://capekngoding.com/uploads/62f5f11a12028_tax.png',
        'title': 'Tax',
      },
      {
        'icon':
            'https://capekngoding.com/uploads/62f5f10615eac_credit-card.png',
        'title': 'Credit Card',
      },
      {
        'icon': 'https://capekngoding.com/uploads/62f5f11912818_protection.png',
        'title': 'Protection',
      },
      {
        'icon': 'https://capekngoding.com/uploads/62f5f11690f23_investment.png',
        'title': 'Investment',
      },
      {
        'icon': 'https://capekngoding.com/uploads/62f5f106a6214_deals.png',
        'title': 'Deals',
      },
    ];

    List carousel = [
      'https://capekngoding.com/uploads/62f5f13e35d3f_promo-1.jpg',
      'https://capekngoding.com/uploads/62f5f13ed034c_promo-2.jpg',
      'https://capekngoding.com/uploads/62f5f14017349_promo-3.jpg',
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(),
        leadingWidth: 0.0,
        title: SizedBox(
          child: Row(
            children: [
              const Text(
                'Garou-Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.discount,
                      color: Colors.purple,
                      size: 20.0,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Promo',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: NetworkImage('https://capekngoding.com/uploads/62f5f123a60ae_15.png'),
                  image: NetworkImage(
                    "https://wallpaperaccess.com/full/1601031.jpg",
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    color: Colors.purple[900]!.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: ListView(
              children: [
                const Text(
                  'G-Cash',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '186.073 USD',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      'G-Points',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      '1.927',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://capekngoding.com/uploads/62f5f11c1adc2_top-up.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Top Up',
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://capekngoding.com/uploads/62f5f11ca7159_transfer.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Transfer',
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://capekngoding.com/uploads/62f5f11dcdff9_withdraw.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Withdraw',
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://capekngoding.com/uploads/62f5f10d73e6b_history.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'History',
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: List.generate(
                      categories.length,
                      (index) {
                        var item = categories[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${item['icon']}'))),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    '${item['title']}',
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
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
                const SizedBox(
                  height: 20.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(carousel.length, (index) {
                    var item = carousel[index];
                    return Card(
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('$item'))),
                      ),
                    );
                  })),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
    //#END
  }
}
