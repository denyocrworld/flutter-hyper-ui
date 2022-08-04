import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PowerList extends StatefulWidget {
  static Map<String, PowerListState> instance = {};
  final String? id;
  final Function(int page) futureBuilder;
  final double? height;
  final double? padding;
  final Gradient? gradient;
  final Color? color;
  final Axis? scrollDirection;
  final bool wrapMode;
  final double? bottomMargin;

  static reloadAll() async {
    for (var key in instance.keys) {
      instance[key]?.reload();
    }
  }

  final Function(int, Map) builder;
  PowerList({
    this.id,
    required this.builder,
    required this.futureBuilder,
    this.height,
    this.padding,
    this.gradient,
    this.color,
    this.scrollDirection,
    this.wrapMode = false,
    this.bottomMargin,
    Key? key,
  }) : super(key: key);

  @override
  State<PowerList> createState() => PowerListState();
}

class PowerListState extends State<PowerList> {
  bool loading = true;
  bool bottomLoading = false;

  List<Map?> items = [];
  int page = 1;
  ScrollController scrollController = ScrollController();

  void onRefresh() async {
    // monitor network fetch
    var response = await widget.futureBuilder(page);
    print(response);
    // if failed,use refreshFailed()
    loading = false;
  }

  bool singleModeLoading = false;

  Future onLoading() async {
    loading = true;
    items.clear();
    setState(() {});
    print("ITEMS CLEAR!");
    await Future.delayed(Duration(milliseconds: 100));

    print("_onLoading...");
    // monitor network fetch
    page = 1;
    var response = await widget.futureBuilder(page);

    if (response != null) {
      for (var i = 0; i < response.length; i++) {
        var item = response[i];
        items.add(item);
      }
    }

    loading = false;
    if (mounted) setState(() {});
    print("onLoading success! ${items.length}");
  }

  Future nextPage() async {
    page++;
    bottomLoading = true;
    setState(() {});
    print("ITEMS CLEAR!");
    await Future.delayed(Duration(milliseconds: 100));

    print("_onLoading...");
    // monitor network fetch
    var response = await widget.futureBuilder(page);

    if (response != null) {
      for (var i = 0; i < response.length; i++) {
        var item = response[i];
        items.add(item);
      }
    }

    bottomLoading = false;
    if (mounted) setState(() {});
    print("onLoading success! ${items.length}");
  }

  late String id;

  @override
  void initState() {
    super.initState();
    id = widget.id ?? Uuid().v4();
    PowerList.instance[id] = this;
    onLoading();
  }

  @override
  void dispose() {
    super.dispose();
    PowerList.instance.remove(id);
    onLoading();
  }

  reload() async {
    if (this.mounted) {
      await onLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

    if (widget.wrapMode) {
      return Wrap(
        children: List.generate(
          items.length,
          (index) {
            var item = (items[index] as Map);
            return widget.builder(index, item);
          },
        ),
      );
    }

    return Container(
      height: widget.height,
      width: Get.width,
      padding: EdgeInsets.all(widget.padding ?? 0.0),
      decoration: BoxDecoration(
        color: widget.color,
        gradient: widget.gradient,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          await reload();
        },
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: items.length,
            scrollDirection: widget.scrollDirection ?? Axis.vertical,
            itemBuilder: (context, index) {
              Map item = (items[index] as Map);
              return Container(
                margin: EdgeInsets.only(
                  bottom: widget.bottomMargin ?? 0.0,
                ),
                child: widget.builder(index, item),
              );
            },
          ),
        ),
      ),
    );
  }
}
