import 'package:flutterx/core.dart';
import 'package:flutter/material.dart';

class ExRadio extends StatefulWidget {
  final String id;
  final String? label;
  final String? value;
  final List<Map<String, dynamic>>? items;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  ExRadio({
    required this.id,
    required this.items,
    this.label = "",
    this.value,
    this.onChanged,
    this.keyboardType,
  });

  @override
  _ExRadioState createState() => _ExRadioState();
}

class _ExRadioState extends State<ExRadio> implements InputControlState {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.value == null) {
      selectedValue = widget.items![0]["label"];
      Input.set(widget.id, widget.items![0]["value"]);
    } else {
      selectedValue = widget.value!;
    }

    if (widget.value == null) {
      selectedValue = widget.items![0]["value"];
    }
    Input.inputController[widget.id] = this;
  }

  setValue(value) {
    var selectedComboItem =
        widget.items!.where((i) => i["value"] == value).toList();

    if (selectedComboItem.isEmpty) {
      Input.set(widget.id, widget.items![0]["value"]);
      selectedValue = widget.items![0]["label"];
    } else {
      var selectedIndex = widget.items!.indexOf(selectedComboItem[0]);
      Input.set(widget.id, widget.items![selectedIndex]["value"]);
      selectedValue = widget.items![selectedIndex]["label"];
    }

    setState(() {});
  }

  resetValue() {
    setState(() {
      Input.set(widget.id, widget.items![0]["value"]);
      selectedValue = widget.items![0]["label"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: widget.label!.isNotEmpty ? 80.0 : 60.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.label!.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(
                  left: 4.0,
                  right: 4.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: Text("${widget.label}"),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.items!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = widget.items![index];
                  bool selected = selectedValue == item["value"];

                  return InkWell(
                    onTap: () {
                      selectedValue = item["value"];
                      setState(() {});
                      if (widget.onChanged != null) {
                        widget.onChanged!(selectedValue!);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected
                            ? Get.theme.primaryColor
                            : Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                      child: Center(
                          child: Text(
                        "${item["value"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selected ? Colors.white : Colors.grey[400],
                        ),
                      )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
