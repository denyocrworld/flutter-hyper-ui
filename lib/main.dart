import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/setup.dart';
import 'package:get/get.dart';

void main() async {
  await initialize();

  //ganti dengan halaman awal yang ingin dibuka ya
  Widget mainView = Container();

  if (FirebaseAuth.instance.currentUser != null) {
    //? jika user sedang dalam keadaan login
    mainView = Container();
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: mainView,
    ),
  );
}

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot<Object?>>(
            stream: FirebaseFirestore.instance
                .collection("products")
                .doc("10001")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error");
              if (!snapshot.hasData) return const Text("No Data");
              Map item = (snapshot.data!.data() as Map);
              item["id"] = snapshot.data!.id;

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
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("products").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error");
              if (!snapshot.hasData) return const Text("No Data");
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.docs.length,
                itemBuilder: (context, index) {
                  var item = (data.docs[index].data() as Map);
                  item["id"] = data.docs[index].id;

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
              );
            },
          ),
        ],
      ),
    );
  }
}
