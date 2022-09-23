import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/module/dashboard/view/dashboard_view.dart';
import 'package:flutter_hyper_ui/setup.dart';
import 'package:get/get.dart';

void main() async {
  await initialize();

  Widget mainView = Container();
  if (FirebaseAuth.instance.currentUser != null) {
    mainView = Container();
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: const DashboardView(),
    ),
  );
}
