import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/setup.dart';

void main() async {
  await initialize();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    ),
  );
}
