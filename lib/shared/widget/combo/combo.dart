import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter/material.dart';

class ExCombo extends StatefulWidget {
  final String id;
  final String label;
  final List items;
  final String? value;
  final dynamic onChanged;

  final double? labelFontSize;
  final double? valueFontSize;

  final bool? visibleIf;

  final bool? disableTranslate;
  final bool? hideLabel;

  const ExCombo({
    Key? key,
    required this.id,
    required this.items,
    this.label = "",
    this.value,
    this.onChanged,
    this.labelFontSize,
    this.valueFontSize,
    this.disableTranslate = false,
    this.visibleIf,
    this.hideLabel = false,
  }) : super(key: key);

  @override
  ExComboState createState() => ExComboState();
}

class ExComboState extends State<ExCombo> implements InputControlState {
  List comboItems = [];
  List<String> items = [];
  String selectedValue = "";

  initItems(starredItems) async {
    comboItems.clear();
    items.clear();

    starredItems.forEach((item) {
      var itemLabel = item["label"];
      if (!widget.disableTranslate!) {
        itemLabel = itemLabel;
      }

      comboItems.add({
        "label": itemLabel,
        "value": item["value"],
      });

      items.add(itemLabel);
    });

    if (Input.get(widget.id) == null) {
      selectedValue = comboItems[0]["label"];
      Input.set(widget.id, comboItems[0]["value"]);
    } else {
      if (widget.value == null) {
        selectedValue = comboItems[0]["label"];
        Input.set(widget.id, comboItems[0]["value"]);
      } else {
        selectedValue = widget.value!;
      }
    }

    if (widget.value != null) {
      updateValueByValue(widget.value!);
    }
    Input.inputController[widget.id] = this;
    if (mounted) {
      setState(() {});
    }
  }

  updateValueByLabel(String label) {
    try {
      var selectedValue =
          comboItems.firstWhere((item) => item["label"] == label);
      Input.set(widget.id, selectedValue["value"]);
    } on Exception catch (_) {
      var selectedValue = comboItems[0];
      Input.set(widget.id, selectedValue["value"]);
    }
  }

  getWhere(item, value) {
    if (item["value"] != null) {
      return item["value"] == value;
    }
    return item != item;
  }

  updateValueByValue(String value) {
    try {
      if (comboItems.isEmpty) return;
      var results = comboItems.where((item) => getWhere(item, value)).toList();

      if (results.isEmpty) return;

      var sv = results[0];
      Input.set(widget.id, sv["value"]);
      selectedValue = sv["label"];
    } on Exception catch (_) {
      var sv = comboItems[0];
      Input.set(widget.id, sv["value"]);
      selectedValue = sv["label"];
    }
  }

  updateList(List newComboItemList) {
    initItems(newComboItemList);
  }

  @override
  void initState() {
    super.initState();
    initItems(widget.items);
    Input.inputController[widget.id] = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  resetValue() {
    setState(() {
      Input.set(widget.id, comboItems[0]["value"]);
      selectedValue = comboItems[0]["label"];
    });
  }

  @override
  setValue(value) {
    var selectedComboItem =
        comboItems.where((i) => i["value"] == value).toList();

    if (selectedComboItem.isEmpty) {
      Input.set(widget.id, comboItems[0]["value"]);
      selectedValue = comboItems[0]["label"];
    } else {
      var selectedIndex = comboItems.indexOf(selectedComboItem[0]);
      Input.set(widget.id, comboItems[selectedIndex]["value"]);
      selectedValue = comboItems[selectedIndex]["label"];
    }

    setState(() {});
  }

  @override
  void didUpdateWidget(ExCombo oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.visibleIf == false) {
      return Container();
    }

    if (comboItems.isEmpty) {
      return const Text("Loading...");
    }

    if (widget.items.isEmpty) {
      return const Text("Loading...");
    }

    if (widget.items.isEmpty) {
      return const Text("Loading...");
    }
    var dropDownButton = DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      icon: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Icon(
          Icons.arrow_downward,
          size: 16.0,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
      iconSize: 16,
      elevation: 16,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
        fontFamily: Theme.of(context).textTheme.bodyText2!.fontFamily,
        color: Theme.of(context).textTheme.bodyText2!.color,
      ),
      underline: Container(
        height: 0,
        color: Colors.grey[300],
      ),
      onChanged: (String? newValue) {
        FocusHelper.unfocus(context);
        setState(() {
          selectedValue = newValue!;
          updateValueByLabel(newValue);

          if (widget.onChanged != null) {
            widget.onChanged();
          }
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              fontSize: widget.valueFontSize ??
                  Theme.of(context).textTheme.bodyText2!.fontSize,
              fontFamily: Theme.of(context).textTheme.bodyText2!.fontFamily,
              color: Theme.of(context).textTheme.bodyText2!.color,
            ),
          ),
        );
      }).toList(),
    );

    getLabel() {
      return Container(
        padding: const EdgeInsets.only(
          left: 4.0,
          right: 4.0,
          top: 4.0,
          bottom: 4.0,
        ),
        width: MediaQuery.of(context).size.width,
        child: Text(
          widget.label,
        ),
      );
    }

    getDropDown() {
      return Container(
        height: 42.0,
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(color: Colors.grey[300]!),
        ),
        // child: DropdownButtonHideUnderline(
        child: DropdownButtonHideUnderline(
          child: dropDownButton,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!widget.hideLabel!) getLabel(),
          getDropDown(),
        ],
      ),
    );
  }
}
