import 'package:flutter/material.dart';
import 'package:flutter_hyper_extension_ui/core.dart';

class ExTextArea extends StatelessWidget {
  final String id;
  final String label;
  final int maxLines;
  final String? value;

  ExTextArea({
    required this.id,
    required this.label,
    this.maxLines = 4,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ExTextField(
      id: id,
      label: label,
      maxLines: 4,
      value: value,
    );
  }
}
