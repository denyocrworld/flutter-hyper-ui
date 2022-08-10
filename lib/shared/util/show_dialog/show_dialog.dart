import 'package:flutter/material.dart';
import 'package:flutter_hyper_extension_ui/core.dart';

import '../get/get.dart';

Future showInfoDialog(
  String title,
  String message, {
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
                label: "Ok",
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
