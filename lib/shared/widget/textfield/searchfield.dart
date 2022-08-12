import 'package:flutter_hyper_ui/core.dart';
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
  final double? size;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  const ExSearchField({
    Key? key,
    required this.id,
    required this.label,
    this.size,
    this.value = "",
    this.hintText = "",
    this.textFieldType = TextFieldType.normal,
    this.onChanged,
    this.onSubmitted,
    this.maxLines,
    this.enabled = true,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

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

  @override
  setValue(value) {
    controller.text = value;
    Input.set(widget.id, value);
  }

  @override
  resetValue() {
    controller.text = "";
    Input.set(widget.id, "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size ?? 50.0,
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[200],
        border: Border.all(
          width: 1.0,
          color: widget.borderColor ?? Colors.grey[200]!,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
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
          icon: const Icon(Icons.search),
          border: InputBorder.none,
        ),
        onChanged: (text) {
          Input.set(widget.id, text);
          if (widget.onChanged != null) widget.onChanged!(text);
        },
        onSubmitted: (text) {
          Input.set(widget.id, text);
          if (widget.onSubmitted != null) widget.onSubmitted!(text);
        },
      ),
    );
  }
}
