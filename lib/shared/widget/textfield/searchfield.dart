import 'package:flutter_hyper_extension_ui/core.dart';
import 'package:flutter/material.dart';

class ExSearchField extends StatefulWidget {
  final String id;
  final String label;
  final String? value;
  final String hintText;
  final TextFieldType textFieldType;
  final int? maxLines;
  final bool? enabled;
  final Color? backgroundColor;
  final Color? borderColor;

  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  ExSearchField({
    required this.id,
    required this.label,
    this.value = "",
    this.hintText = "",
    this.textFieldType = TextFieldType.normal,
    this.onChanged,
    this.onSubmitted,
    this.maxLines,
    this.enabled = true,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  _ExSearchFieldState createState() => _ExSearchFieldState();
}

class _ExSearchFieldState extends State<ExSearchField>
    implements InputControlState {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.value ?? "";
    textFieldController[widget.id] = controller;
    Input.set(widget.id, widget.value);
    Input.inputController[widget.id] = this;
  }

  setValue(value) {
    controller.text = value;
    Input.set(widget.id, value);
  }

  resetValue() {
    controller.text = "";
    Input.set(widget.id, "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 12.0,
            right: 12.0,
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(
              width: 1.0,
              color: widget.borderColor ?? Colors.grey[200]!,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: TextField(
            controller: controller,
            maxLines: widget.maxLines ?? 1,
            obscureText:
                widget.textFieldType == TextFieldType.password ? true : false,
            readOnly: widget.enabled! ? false : true,
            decoration: InputDecoration(
              hintText: widget.hintText,
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
            onChanged: (text) {
              Input.set(widget.id, text);
              if (widget.onChanged != null) return widget.onChanged!(text);
            },
            onSubmitted: (text) {
              Input.set(widget.id, text);
              if (widget.onSubmitted != null) return widget.onSubmitted!(text);
            },
          ),
        ),
      ],
    );
  }
}
