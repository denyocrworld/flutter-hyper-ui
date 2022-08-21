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
