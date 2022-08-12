import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExDatePicker extends StatefulWidget {
  final String id;
  final String? label;
  final DateTime? value;
  final Function(DateTime value)? onChanged;

  const ExDatePicker({
    Key? key,
    required this.id,
    this.label,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  ExDatePickerState createState() => ExDatePickerState();
}

class ExDatePickerState extends State<ExDatePicker>
    implements InputControlState {
  DateTime? dateValue;

  @override
  void initState() {
    super.initState();
    // value = widget.value ?? DateTime.now();
    dateValue = widget.value;
    Input.set(widget.id, dateValue);
    Input.inputController[widget.id] = this;
  }

  String get formattedValue {
    if (dateValue == null) return "-- select date --";
    return DateFormat("d MMM y").format(dateValue!);
  }

  @override
  resetValue() {
    dateValue = null;
    Input.set(widget.id, dateValue);
    setState(() {});
  }

  @override
  setValue(value) {
    dateValue = value;
    Input.set(widget.id, value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
              top: 4.0,
              bottom: 4.0,
            ),
            child: Text("${widget.label}"),
          ),
          InkWell(
            onTap: () async {
              var selectedDay = await showDatePicker(
                context: context,
                initialDate: dateValue ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
                builder: (context, child) {
                  return child!;
                },
              );

              if (selectedDay == null) return;

              setState(() {
                dateValue = selectedDay;
                Input.set(widget.id, dateValue);

                if (widget.onChanged != null) widget.onChanged!(dateValue!);
              });
            },
            child: Container(
              height: 38.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[300]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Row(
                children: [
                  Text(formattedValue),
                  const Spacer(),
                  Icon(
                    Icons.calendar_view_month,
                    color: Colors.grey[500],
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
