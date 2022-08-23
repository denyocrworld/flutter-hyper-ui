import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_hyper_ui/shared/widget/rating/rating.dart';

// ignore: use_key_in_widget_constructors
class DevSnippetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    test() async {
      /*
      var String = """

//#TEMPLATE srcNoImage
"https://i.ibb.co/S32HNjD/no-image.jpg"
//#END
//#TEMPLATE srcMeImage
"https://i.ibb.co/PGv8ZzG/me.jpg"
//#END

""";

      //#TEMPLATE navpush
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Container()),
      );
      //#END

      //#TEMPLATE navreplace
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Container()),
      );
      //#END

      //#TEMPLATE navback
      Navigator.pop(context);
      //#END

      //#TEMPLATE firelogin
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "user@demo.com",
        password: "123456 xxx",
      );
      //#END

      //#TEMPLATE firelogout
      await FirebaseAuth.instance.signOut();
      //#END

      //#TEMPLATE fireadd
      await FirebaseFirestore.instance.collection("products").add({
        "product_name": "ProductXXX",
        "price": 25,
      });
      //#END

      //#TEMPLATE fireupdate
      await FirebaseFirestore.instance
          .collection("products")
          .doc("xxx")
          .update({
        "product_name": "ProductXXX",
        "price": 25,
      });
      //#END
      //#TEMPLATE firedelete
      await FirebaseFirestore.instance
          .collection("products")
          .doc("xxx")
          .delete();
      //#END
      //#TEMPLATE fireget
      await FirebaseFirestore.instance.collection("products").get();
      //#END
      //#TEMPLATE firesnapshot
      await FirebaseFirestore.instance.collection("products").snapshots();
      //#END

      */
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("DevSnippet"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(
              height: 500.0,
              child: Builder(
                builder: (context) {
                  //#TEMPLATE scaffold_ovo
                  // ------------------------
                  // [1] Update pubspec.yaml
                  // flutter_custom_clippers:
                  // ------------------------
                  // [2] Import
                  // import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
                  // ------------------------
                  // inspiration: OVO App
                  // started by: Danu Septian
                  // website: https://danuseptian.com/
                  // ------------------------

                  return Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      title: const Text(
                        "OWO",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 6.0,
                                  bottom: 6.0,
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://i.ibb.co/Kx4dGMD/1892602.png",
                                      color: Colors.purple[900],
                                      width: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      "Promo",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.purple[900],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250 + MediaQuery.of(context).padding.top,
                            child: Stack(
                              children: [
                                ClipPath(
                                  clipper: WaveClipperTwo(),
                                  child: Container(
                                    height: 220,
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
                                          color: Colors.purple[900]!
                                              .withOpacity(0.7),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SafeArea(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "OWO Cash",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        const Text(
                                          "5000 USD",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Points",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                              "4500",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.all(20.0),
                                            child: Builder(builder: (context) {
                                              var menus = [
                                                {
                                                  "icon":
                                                      "https://i.ibb.co/9VyBkjg/5894760.png",
                                                  "label": "Topup",
                                                },
                                                {
                                                  "icon":
                                                      "https://i.ibb.co/rFLH1JF/2048743.png",
                                                  "label": "Transfer",
                                                },
                                                {
                                                  "icon":
                                                      "https://i.ibb.co/KxJ01vc/892209.png",
                                                  "label": "Withdraw",
                                                },
                                                {
                                                  "icon":
                                                      "https://i.ibb.co/L17PNDX/2901149.png",
                                                  "label": "History",
                                                },
                                              ];
                                              return Row(
                                                children: List.generate(
                                                  menus.length,
                                                  (index) {
                                                    var menu = menus[index];

                                                    return Expanded(
                                                      child: Column(
                                                        children: [
                                                          ImageIcon(
                                                            NetworkImage(
                                                              "${menu["icon"]}",
                                                            ),
                                                            color: Colors
                                                                .purple[900],
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          Text(
                                                            "${menu["label"]}",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  //#END
                },
              ),
            ),
            Container(
              height: 200.0,
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) {
                  //#TEMPLATE scaffold
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("Dashboard"),
                      actions: [
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.tune),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.notifications),
                          ),
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ),
                  );
                  //#END
                },
              ),
            ),

            //#TEMPLATE contrad
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
            //#END
            //#TEMPLATE conimage
            Container(
              height: 100.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://i.ibb.co/3pPYd14/freeban.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
            //#END

            Container(
              //#TEMPLATE decoration
              decoration: const BoxDecoration(),
              //#END
            ),

            //----------------------------------------
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                  //#TEMPLATE border
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[900]!,
                  ),
                  //#END
                  //#TEMPLATE radius
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  //#END
                  //#TEMPLATE shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 7),
                    ),
                  ],
                  //#END
                  //#TEMPLATE decoration_image
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://i.ibb.co/3pPYd14/freeban.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  //#END
                  //#TEMPLATE gradient
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.red,
                    ],
                  )
                  //#END
                  ),
            ),
            //----------------------------------------

            //#TEMPLATE item_card
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const NetworkImage(
                    "https://i.ibb.co/QrTHd59/woman.jpg",
                  ),
                ),
                title: const Text("Jessica Doe"),
                subtitle: const Text("Programmer"),
              ),
            ),
            //#END
            //#TEMPLATE item_cart
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const NetworkImage(
                    "https://i.ibb.co/xgwkhVb/740922.png",
                  ),
                ),
                title: const Text("Apple"),
                subtitle: const Text("15 USD"),
                trailing: SizedBox(
                  width: 120.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        color: Colors.grey[800],
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.grey[800],
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //#END
            //#TEMPLATE item_social_facebook
            Card(
              child: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://i.ibb.co/QrTHd59/woman.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  12.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Donni Yen",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Donni Yen",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "August 17 at 11:00 PM",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.more_horiz,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Container(
                      height: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.ibb.co/3pPYd14/freeban.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.thumb_up,
                                  size: 20.0,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          SizedBox(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  size: 20.0,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.share,
                            size: 20.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //#END
            //#TEMPLATE list_people
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: const NetworkImage(
                        "https://i.ibb.co/QrTHd59/woman.jpg",
                      ),
                    ),
                    title: const Text("Jessica Doe"),
                    subtitle: const Text("Programmer"),
                  ),
                );
              },
            ),
            //#END
            //#TEMPLATE list_cart
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: const NetworkImage(
                        "https://i.ibb.co/xgwkhVb/740922.png",
                      ),
                    ),
                    title: const Text("Apple"),
                    subtitle: const Text("15 USD"),
                    trailing: SizedBox(
                      width: 120.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Card(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            //#END
            //#TEMPLATE item_welcome
            Row(
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
                      "Let's relax and watch movie",
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
            //#END
            /*
                //#TEMPLATE slider_flh
                ExSlider(
                  items: [
                    {
                      "id": 1,
                      "photo":
                          "https://thumbor.prod.vidiocdn.com/OLVC3ZXqqBFciq_LXuoYrLIQO5Y=/223x332/filters:quality(75)/vidio-web-prod-film/uploads/film/image_portrait/1756/serigala-terakhir-ec6e22.jpg",
                      "onTap": (item) {
                        print("Test");
                      },
                    },
                    {
                      "id": 2,
                      "photo":
                          "https://thumbor.prod.vidiocdn.com/OLVC3ZXqqBFciq_LXuoYrLIQO5Y=/223x332/filters:quality(75)/vidio-web-prod-film/uploads/film/image_portrait/1756/serigala-terakhir-ec6e22.jpg",
                      "onTap": (item) {
                        print("Test");
                      },
                    }
                  ],
                ),
                //#END
                */
            //#TEMPLATE item_movie_flh
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 160.0,
                    width: 120.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.ibb.co/Ksk6d1K/movie.webp",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 160.0,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Pertaruhan",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          ExRating(
                            id: "rating",
                            value: 4,
                            itemSize: 18.0,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "1h 30min",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.orange,
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          child: const Text(
                            "Book",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //#END
            Builder(
              builder: (context) {
                //#TEMPLATE simple_scaffold
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Dashboard"),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: const [],
                      ),
                    ),
                  ),
                );
                //#END
              },
            ),
            Builder(
              builder: (context) {
                return Scaffold(
                  //#TEMPLATE simple_body
                  body: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: const [],
                      ),
                    ),
                  ),
                  //#END
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
