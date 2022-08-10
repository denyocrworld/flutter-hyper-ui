import 'package:flutter_hyper_extension_ui/core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: defaultTheme,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Hyper UI Kit"),
      ),
    ),
  ));
}
