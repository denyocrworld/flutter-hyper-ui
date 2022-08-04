import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';

Future showConfirmDialog(
  String title,
  String message, {
  Function? onCancel,
  Function? onConfirm,
}) async {
  await Get.defaultDialog(
    title: "$title",
    content: Column(
      children: [
        Text("$message"),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: ExButton(
                label: "No",
                color: disabledColor,
                onPressed: () {
                  if (onCancel != null) {
                    onCancel();
                    return;
                  }
                  Get.back();
                },
              ),
            ),
            Expanded(
              child: ExButton(
                label: "Yes",
                color: primaryColor,
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm();
                    return;
                  }
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
