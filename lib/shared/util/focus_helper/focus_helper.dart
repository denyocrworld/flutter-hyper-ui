import 'package:flutter/material.dart';

class FocusHelper {
  static void unfocus(context) {
    print("FocusHelper@unfocus();");
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
