import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter/material.dart';

Map<String, ExSearchPickerState> searchPickerController = {};

class ExSearchPicker extends StatefulWidget {
  final String id;
  final String? label;
  final String? value;
  final String hintText;
  final TextFieldType textFieldType;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? enabled;
  final Future Function(String text) futureBuilder;
  final String Function(Object) labelFieldBuilder;
  final String Function(Object) infoFieldBuilder;
  final String Function(Object) idFieldBuilder;

  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmitted;

  const ExSearchPicker({
    Key? key,
    required this.id,
    required this.futureBuilder,
    required this.labelFieldBuilder,
    required this.infoFieldBuilder,
    required this.idFieldBuilder,
    this.label,
    this.value = "",
    this.hintText = "",
    this.textFieldType = TextFieldType.normal,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.enabled = true,
  }) : super(key: key);

  @override
  ExSearchPickerState createState() => ExSearchPickerState();
}

class ExSearchPickerState extends State<ExSearchPicker>
    implements InputControlState {
  TextEditingController controller = TextEditingController();
  Object? currentSearch;

  @override
  void initState() {
    super.initState();
    controller.text = widget.value ?? "";
    searchPickerController[widget.id] = this;
    Input.set(widget.id, widget.value);
    Input.inputController[widget.id] = this;
  }

  @override
  setValue(value) {
    controller.text = value ?? "";
    Input.set(widget.id, value);
  }

  @override
  resetValue() {
    controller.text = "";
    Input.set(widget.id, "");
  }

  searchSearch() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPickerSearchList(
          futureBuilder: widget.futureBuilder,
          labelFieldBuilder: widget.labelFieldBuilder,
          infoFieldBuilder: widget.infoFieldBuilder,
          idFieldBuilder: widget.idFieldBuilder,
        ),
      ),
    );

    if (selectedSearch != null) {
      // controller.text = selectedSearch!.namaSearch.toString();
      controller.text = widget.labelFieldBuilder(selectedSearch!);
      currentSearch = selectedSearch;
    }

    var value =
        currentSearch == null ? null : widget.idFieldBuilder(selectedSearch!);

    if (currentSearch == null) {
      Input.set(widget.id, value);
    } else {
      // Input.set(widget.id, currentSearch!.id);
      Input.set(widget.id, value);
    }
    setState(() {});

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          // color: Colors.white,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(widget.label!),
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
          InkWell(
            onTap: () => searchSearch(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[300]!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          maxLines:
                              widget.textFieldType == TextFieldType.password
                                  ? 1
                                  : widget.maxLines,
                          keyboardType: widget.keyboardType,
                          obscureText:
                              widget.textFieldType == TextFieldType.password
                                  ? true
                                  : false,
                          readOnly: true,
                          decoration: InputDecoration.collapsed(
                            hintText: widget.hintText,
                          ),
                          onChanged: (text) {
                            Input.set(widget.id, text);
                            if (widget.onChanged != null) {
                              widget.onChanged!(text);
                            }
                          },
                          onSubmitted: (text) {
                            Input.set(widget.id, text);
                            if (widget.onSubmitted != null) {
                              widget.onSubmitted!(text);
                            }
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () => searchSearch(),
                        child: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
                if (currentSearch != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: Text("Nomor Asset: ${currentSearch!.namaSearch}"),
                    child: Text(widget.infoFieldBuilder(currentSearch!)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPickerSearchList extends StatefulWidget {
  final Future Function(String text) futureBuilder;
  final String Function(Object) labelFieldBuilder;
  final String Function(Object) infoFieldBuilder;
  final String Function(Object) idFieldBuilder;

  const SearchPickerSearchList({
    Key? key,
    required this.futureBuilder,
    required this.labelFieldBuilder,
    required this.infoFieldBuilder,
    required this.idFieldBuilder,
  }) : super(key: key);

  @override
  State<SearchPickerSearchList> createState() => _SearchPickerSearchListState();
}

Map? selectedSearch;

class _SearchPickerSearchListState extends State<SearchPickerSearchList> {
  String search = "";

  @override
  void initState() {
    super.initState();
    selectedSearch = null;
  }

  Future getFuture() async {
    // future: SearchService().getSearchList(
    //   search: search,
    // ),

    return widget.futureBuilder(search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search by Nama Search",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.grey,
                  ),

                  // suffixIcon: Icon(
                  //   Icons.tune_outlined,
                  //   size: 24,
                  //   color: Colors.grey,
                  // ),
                ),
                onSubmitted: (value) async {
                  search = "";
                  setState(() {});

                  await Future.delayed(const Duration(milliseconds: 100));

                  search = value;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: PowerList(
                id: "search_picker_list",
                futureBuilder: (page) async {
                  return await widget.futureBuilder(search);
                },
                builder: (index, item) {
                  return InkWell(
                    onTap: () {
                      selectedSearch = item;
                      Navigator.pop(context);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(widget.labelFieldBuilder(item)),
                        subtitle: Text(widget.infoFieldBuilder(item)),
                      ),
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
