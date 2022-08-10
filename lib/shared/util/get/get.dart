import 'package:flutter/material.dart';

class Get {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get context {
    return navigatorKey.currentContext;
  }

  static to(Widget page) async {
    await navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static back() {
    navigatorKey.currentState!.pop(context);
  }

  static offAll(page) {
    navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static showDialog({
    required String title,
    required Widget content,
  }) {}

  static snackbar(
    String title,
    String message, {
    Color? backgroundColor,
    Color? colorText,
    EdgeInsets? margin,
  }) {}

  static double get width {
    return MediaQuery.of(context).size.width;
  }

  static double get height {
    return MediaQuery.of(context).size.width;
  }

  static defaultDialog({
    required String title,
    required Widget content,
  }) async {
    showDialog(
      title: title,
      content: content,
    );
  }
}
