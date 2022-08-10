import 'package:flutter/material.dart';
import '../get/get.dart';

BuildContext? loadingContext;
bool loadingRendered = false;
showLoading() async {
  loadingContext = null;

  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    useRootNavigator: false,
    builder: (context) {
      loadingContext = context;

      return Stack(
        children: [
          Center(
            child: CircleAvatar(
              radius: 26.0,
              backgroundColor: Colors.white,
              child: CircularProgressIndicator(),
            ),
            // child: CircularProgressIndicator(),
          ),
        ],
      );
    },
  );
}

hideLoading() {
  // Navigator.pop(loadingContext!);
  Get.back();
}
