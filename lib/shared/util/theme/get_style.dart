import 'package:flutter/material.dart';

class GetStyle {
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final Color? color;
  final double? borderWidth;
  final double? radius;

  GetStyle({
    this.labelStyle,
    this.valueStyle,
    this.color,
    this.borderWidth,
    this.radius,
  });
}

GetStyle getStyle(int? styleIndex) {
  if (styleIndex == 1) return GetStyle(); //default style

  if (styleIndex == 2)
    return GetStyle(
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      valueStyle: TextStyle(
        color: Colors.white,
      ),
      color: Colors.white.withOpacity(0.3),
      radius: 30.0,
      borderWidth: 0.0,
    );

  if (styleIndex == 3)
    return GetStyle(
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      valueStyle: TextStyle(
        color: Colors.white,
      ),
      color: Colors.white,
      radius: 12.0,
      borderWidth: 0.0,
    );

  //undefined style
  return GetStyle();
}
