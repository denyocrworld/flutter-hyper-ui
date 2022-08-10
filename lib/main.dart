import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: defaultTheme,
    home: FlutterHyperUiKitDemoView(),
  ));
}
