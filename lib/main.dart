import 'package:flutterx/core.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/shared/util/get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: Get.navigatorKey,
    theme: defaultTheme,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Hyper UI Kit"),
      ),
    ),
  ));
}
