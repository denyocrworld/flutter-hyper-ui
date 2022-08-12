import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  const PowerList({
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
    await widget.futureBuilder(page);

    // if failed,use refreshFailed()
    loading = false;
  }

  bool singleModeLoading = false;

  Future onLoading() async {
    loading = true;
    items.clear();
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 100));

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
  }

  Future nextPage() async {
    page++;
    bottomLoading = true;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 100));

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
  }

  late String id;

  @override
  void initState() {
    super.initState();
    id = widget.id ?? const Uuid().v4();
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
      width: MediaQuery.of(context).size.width,
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
