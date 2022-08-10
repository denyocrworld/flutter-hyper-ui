import 'package:flutter_hyper_extension_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_extension_ui/demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: defaultTheme,
    home: FlutterHyperUiKitDemoView(),
  ));
}
