import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/setup.dart';

void main() async {
  await initialize();
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: defaultTheme,
    home: const Scaffold(),
  ));
}
