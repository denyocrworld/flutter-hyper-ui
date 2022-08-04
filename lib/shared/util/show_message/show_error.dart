import '../../../core.dart';
import 'package:flutter/material.dart';

var _alertMargin = EdgeInsets.all(12.0);

showSuccess(
  String? title,
  String? message,
) {
  Get.snackbar(
    "${title ?? ""}",
    "${message ?? ""}",
    backgroundColor: successColor,
    colorText: Colors.white,
    margin: _alertMargin,
  );
}

showError(
  String? title,
  String? message,
) {
  Get.snackbar(
    "${title ?? ""}",
    "${message ?? ""}",
    backgroundColor: dangerColor,
    colorText: Colors.white,
    margin: _alertMargin,
  );
}

showInfo(
  String? title,
  String? message,
) {
  Get.snackbar(
    "${title ?? ""}",
    "${message ?? ""}",
    backgroundColor: infoColor,
    colorText: Colors.white,
    margin: _alertMargin,
  );
}

showWarning(
  String? title,
  String? message,
) {
  Get.snackbar(
    "${title ?? ""}",
    "${message ?? ""}",
    backgroundColor: warningColor,
    colorText: Colors.white,
    margin: _alertMargin,
  );
}

showPrimary(
  String? title,
  String? message,
) {
  Get.snackbar(
    "${title ?? ""}",
    "${message ?? ""}",
    backgroundColor: primaryColor,
    colorText: Colors.white,
    margin: _alertMargin,
  );
}

showDisabled(
  String? title,
  String? message,
) {
  Get.snackbar(
    "${title ?? ""}",
    "${message ?? ""}",
    backgroundColor: disabledColor,
    colorText: disabledTextColor,
    margin: _alertMargin,
  );
}
