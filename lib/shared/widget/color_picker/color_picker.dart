import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter/material.dart';

/*
Dynamic Color Picker
*/
class ExColorPicker extends StatefulWidget {
  final String id;
  final String label;
  final Color? value;
  final List<Color>? colorsList;
  final dynamic onChanged;
  final bool enableCustomColor;

  final double? labelFontSize;
  final double? valueFontSize;

  final bool? visibleIf;

  final bool? disableTranslate;
  final bool? hideLabel;

  const ExColorPicker({
    Key? key,
    required this.id,
    this.colorsList,
    this.label = "",
    this.value,
    this.onChanged,
    this.labelFontSize,
    this.valueFontSize,
    this.disableTranslate = false,
    this.visibleIf,
    this.hideLabel = false,
    this.enableCustomColor = true,
  }) : super(key: key);

  @override
  ExColorPickerState createState() => ExColorPickerState();
}

class ExColorPickerState extends State<ExColorPicker>
    implements InputControlState {
  bool customColor = false;
  Color? selectedValue;
  List<Color> colorList = [
    Colors.red[300]!,
    Colors.blue[300]!,
    Colors.blueGrey[300]!,
    Colors.orange[300]!,
  ];
  @override
  void initState() {
    super.initState();
    colorList = widget.colorsList ?? colorList;
    selectedValue = widget.value;
    checkColorExistence();
    Input.set(widget.id, selectedValue);
    Input.inputController[widget.id] = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void checkColorExistence() {
    if (selectedValue == null) return;

    if (colorList.contains(selectedValue!)) {
      customColor = false;
    } else {
      customColor = true;
    }
  }

  @override
  setValue(value) {
    selectedValue = value;
    checkColorExistence();
    Input.set(widget.id, selectedValue);
    setState(() {});
  }

  @override
  resetValue() {
    setState(() {
      selectedValue = null;
      Input.set(widget.id, selectedValue);
    });
  }

  @override
  void didUpdateWidget(ExColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  showColor() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              controller: ScrollController(),
              child: ColorPicker(
                pickerColor: selectedValue!,
                onColorChanged: (color) {
                  setValue(color);
                },
              ),
              // Use Material color picker:
              //
              // child: MaterialPicker(
              //   pickerColor: pickerColor,
              //   onColorChanged: changeColor,
              //   showLabel: true, // only on portrait mode
              // ),
              //
              // Use Block color picker:
              //
              // child: BlockPicker(
              //   pickerColor: currentColor,
              //   onColorChanged: changeColor,
              // ),
              //
              // child: MultipleChoiceBlockPicker(
              //   pickerColors: currentColors,
              //   onColorsChanged: changeColors,
              // ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.visibleIf == false) {
      return Container();
    }

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

    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!widget.hideLabel!) getLabel(),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                if (customColor)
                  InkWell(
                    onTap: () {
                      // setValue(color);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: selectedValue,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: colorList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var color = colorList[index];
                      bool selected = color == selectedValue ? true : false;

                      return InkWell(
                        onTap: () {
                          setValue(color);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor:
                                selected ? Colors.grey[300] : Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundColor: color,
                                child: !selected
                                    ? Container()
                                    : const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (widget.enableCustomColor)
                  InkWell(
                    onTap: () {
                      showColor();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor:
                                selectedValue == null || customColor == false
                                    ? Colors.blueGrey[300]
                                    : selectedValue,
                            child: const Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
