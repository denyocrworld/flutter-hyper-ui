import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ExSlider extends StatefulWidget {
  final double? height;
  final List<String> items;
  final bool showIndicator;
  const ExSlider({
    Key? key,
    this.height = 180.0,
    this.showIndicator = false,
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
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${widget.items.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
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
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
    return Container(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: getImageSliders(),
              carouselController: controller,
              options: CarouselOptions(
                  autoPlay: true,
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
