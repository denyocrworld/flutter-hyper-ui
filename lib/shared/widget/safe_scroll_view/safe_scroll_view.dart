import 'package:flutter/material.dart';

class SafeScrollView extends StatelessWidget {
  final Widget child;
  final controller;

  SafeScrollView({
    required this.child,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller ?? ScrollController(),
      child: child,
    );
  }
}
