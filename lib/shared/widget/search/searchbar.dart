import 'package:flutter/material.dart';

class ExSearchBar extends StatefulWidget {
  final String id;
  final Function(String value) onSubmitted;
  final Function? onFilterClick;
  final Color? color;
  final double? height;

  ExSearchBar({
    required this.id,
    required this.onSubmitted,
    this.onFilterClick,
    this.height,
    this.color,
  });
  @override
  ExSearchBarState createState() => ExSearchBarState();
}

class ExSearchBarState extends State<ExSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Container(
        child: TextField(
          onSubmitted: (text) {
            widget.onSubmitted(text);
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(
              fontSize: 12.0,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 24,
              color: Colors.grey,
            ),
            suffixIcon: InkWell(
              onTap: () {
                if (widget.onFilterClick != null) {
                  widget.onFilterClick!();
                }
              },
              child: Icon(
                Icons.tune_outlined,
                size: 24,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
