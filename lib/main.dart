import 'package:flutter_hyper_extension_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_extension_ui/shared/util/get/get.dart';

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
