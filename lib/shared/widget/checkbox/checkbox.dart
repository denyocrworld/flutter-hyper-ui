import 'package:flutterx/core.dart';
import 'package:flutter/material.dart';

class ExCheckBox extends StatefulWidget {
  final String id;
  final String? label;
  final List<String>? value;
  final List<Map<String, dynamic>>? items;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  ExCheckBox({
    required this.id,
    required this.items,
    this.label = "",
    this.value,
    this.onChanged,
    this.keyboardType,
  });

  @override
  _ExCheckBoxState createState() => _ExCheckBoxState();
}

class _ExCheckBoxState extends State<ExCheckBox> implements InputControlState {
  List<String> selectedValues = [];

  @override
  void initState() {
    super.initState();
    if (widget.value == null) {
      selectedValues = [];
    } else {
      for (var i = 0; i < widget.value!.length; i++) {
        selectedValues.add(widget.value![i]);
      }
    }
    Input.set(widget.id, selectedValues);
    Input.inputController[widget.id] = this;
  }

  setValue(value) {
    selectedValues = value;
    Input.set(widget.id, selectedValues);
    setState(() {});
  }

  resetValue() {
    setState(() {
      Input.set(widget.id, []);
      selectedValues = widget.items![0]["label"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.label!.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.only(
                  left: 4.0,
                  right: 4.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: Text("${widget.label}"),
              ),
              SizedBox(
                height: 6.0,
              ),
            ],
            Column(
              children: List.generate(widget.items!.length, (index) {
                var item = widget.items![index];
                bool selected =
                    selectedValues.contains(item["value"]) ? true : false;

                return Container(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 2.0,
                    bottom: 2.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${item["label"]}"),
                      ),
                      Checkbox(
                        value: selected,
                        onChanged: (value) {
                          if (value == true) {
                            selectedValues.add(item["value"]);
                          } else {
                            selectedValues.remove(item["value"]);
                          }
                          Input.set(widget.id, selectedValues);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
