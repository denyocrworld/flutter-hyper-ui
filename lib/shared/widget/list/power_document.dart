import 'package:flutter/material.dart';

class PowerDocument extends StatefulWidget {
  static Map<String, PowerDocumentState> instance = {};
  final String id;
  final Function(int page) futureBuilder;

  static reloadAll() async {
    for (var key in instance.keys) {
      instance[key]?.reload();
    }
  }

  final Function(Map) builder;
  const PowerDocument({
    required this.id,
    required this.builder,
    required this.futureBuilder,
    Key? key,
  }) : super(key: key);

  @override
  State<PowerDocument> createState() => PowerDocumentState();
}

class PowerDocumentState extends State<PowerDocument> {
  bool loading = true;
  Map? item;
  int page = 1;
  ScrollController scrollController = ScrollController();

  void onRefresh() async {
    // monitor network fetch
    await widget.futureBuilder(page);

    // if failed,use refreshFailed()
    loading = false;
  }

  bool singleModeLoading = false;

  Future onLoading() async {
    loading = true;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 100));

    // monitor network fetch
    int page = 1;
    var response = await widget.futureBuilder(page);

    if (response != null) {
      item = response;
    }

    loading = false;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    PowerDocument.instance[widget.id] = this;
    onLoading();
  }

  reload() async {
    if (mounted) {
      await onLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Builder(
      builder: (context) {
        return widget.builder(item!);
      },
    );
  }
}
