import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ExSlider extends StatefulWidget {
  final double? height;
  final List<Map> items;
  final bool showIndicator;
  final bool autoPlay;
  final List<Widget> children;

  const ExSlider({
    Key? key,
    this.height = 180.0,
    this.showIndicator = false,
    this.autoPlay = true,
    this.children = const [],
    required this.items,
  }) : super(key: key);

  @override
  State<ExSlider> createState() => _ExSliderState();
}

class _ExSliderState extends State<ExSlider> {
  final CarouselController controller = CarouselController();
  int selectedIndex = 0;

  List<Widget> getImageSliders() {
    return widget.items
        .map((item) => InkWell(
              onTap: () => item["onTap"](item),
              child: SizedBox(
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(item["photo"],
                              fit: BoxFit.cover, width: 1000.0),
                          ...widget.children,
                        ],
                      )),
                ),
              ),
            ))
        .toList();
  }

  getIndicator() {
    if (widget.showIndicator == false) return Container();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.items.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(selectedIndex == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: getImageSliders(),
              carouselController: controller,
              options: CarouselOptions(
                  autoPlay: widget.autoPlay,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      selectedIndex = index;
                    });
                  }),
            ),
          ),
          getIndicator(),
        ],
      ),
    );
  }
}
