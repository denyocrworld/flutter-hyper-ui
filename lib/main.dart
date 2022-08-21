import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/setup.dart';
import 'package:get/get.dart';

void main() async {
  await initialize();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: const Scaffold(),
    ),
  );
}
