import 'package:flutterx/core.dart';
import 'package:flutter/material.dart';

enum TextFieldType {
  normal,
  password,
}

Map<String, TextEditingController> textFieldController = {};

class ExTextField extends StatefulWidget {
  final String id;
  final String? label;
  final String? value;
  final String hintText;
  final TextFieldType textFieldType;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? enabled;

  final int? style;
  final double? size;

  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  ExTextField({
    required this.id,
    this.label,
    this.value = "",
    this.hintText = "",
    this.textFieldType = TextFieldType.normal,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.enabled = true,
    //-----------
    this.style,
    this.size,
  });

  @override
  _ExTextFieldState createState() => _ExTextFieldState();
}

class _ExTextFieldState extends State<ExTextField>
    implements InputControlState {
  TextEditingController controller = TextEditingController();

  late GetStyle theme;

  @override
  void initState() {
    super.initState();
    controller.text = widget.value ?? "";
    textFieldController[widget.id] = controller;
    Input.set(widget.id, widget.value);
    Input.inputController[widget.id] = this;
    theme = getStyle(widget.style);
  }

  setValue(value) {
    controller.text = value ?? "";
    Input.set(widget.id, value);
  }

  resetValue() {
    controller.text = "";
    Input.set(widget.id, "");
  }

  @override
  Widget build(BuildContext context) {
    double textAreaHeight = 0;
    if (widget.maxLines != null && widget.maxLines! >= 2) {
      textAreaHeight = (widget.size ?? md) * widget.maxLines!;
    }
    var height = (textAreaHeight) + (widget.size ?? md) + 50;

    return Container(
      height: height,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          // color: Colors.white,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Padding(
              padding: EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(
                widget.label!,
                style: theme.labelStyle,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
          ],
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: theme.color,
                border: Border.all(
                  width: theme.borderWidth ?? 1.0,
                  color: Colors.grey[300]!,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(theme.radius ?? 4.0)),
              ),
              child: TextField(
                controller: controller,
                maxLines: widget.maxLines ?? 1,
                keyboardType: widget.keyboardType,
                obscureText: widget.textFieldType == TextFieldType.password
                    ? true
                    : false,
                readOnly: widget.enabled! ? false : true,
                style: theme.valueStyle,
                decoration: InputDecoration.collapsed(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey[400],
                  ),
                ),
                onChanged: (text) {
                  Input.set(widget.id, text);
                  if (widget.onChanged != null) return widget.onChanged!(text);
                },
                onSubmitted: (text) {
                  Input.set(widget.id, text);
                  if (widget.onSubmitted != null)
                    return widget.onSubmitted!(text);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
