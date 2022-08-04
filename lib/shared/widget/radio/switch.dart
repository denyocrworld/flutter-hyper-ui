import 'package:flutterx/core.dart';
import 'package:flutter/material.dart';

class ExSwitch extends StatefulWidget {
  final String id;
  final String? label;
  final bool? value;
  final Function(String)? onChanged;

  ExSwitch({
    required this.id,
    this.label = "",
    this.value = false,
    this.onChanged,
  });

  @override
  _ExSwitchState createState() => _ExSwitchState();
}

class _ExSwitchState extends State<ExSwitch> implements InputControlState {
  bool? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value!;
    Input.inputController[widget.id] = this;
    Input.set(widget.id, selectedValue);
  }

  setValue(value) {
    selectedValue = value;
    setState(() {});
  }

  resetValue() {
    Input.set(widget.id, false);
    selectedValue = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text("${widget.label}"),
            ),
            Switch(
              value: selectedValue!,
              onChanged: (value) {
                setValue(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
