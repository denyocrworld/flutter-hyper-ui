import 'package:flutter/material.dart';
import 'package:flutterx/core.dart';

class ExButton extends StatelessWidget {
  final String? label;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? height;
  final double? width;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final double? fontSize;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool enabled;
  final bool outline;
  final double? size;

  ExButton({
    required this.onPressed,
    this.label,
    this.color,
    this.textColor,
    this.icon,
    this.height = 40,
    this.width,
    this.borderRadius,
    this.boxShadow,
    this.fontSize,
    this.margin,
    this.padding,
    this.enabled = true,
    this.outline = false,
    this.size,
  });

  getColor() {
    if (outline) return Colors.white;
    return enabled ? (color ?? Get.theme.primaryColor) : disabledColor;
  }

  getTextColor() {
    if (textColor != null) return textColor;
    if (outline) return color;
    return color == disabledColor ? disabledTextColor : Colors.white;
  }

  getHeight() {
    if (size == xs) {
      return xs;
    } else if (size == sm) {
      return sm;
    } else if (size == md) {
      return md;
    } else if (size == xl) {
      return xl;
    }
    return height;
  }

  getWidth() {
    return width;
  }

  getFontSize() {
    if (size == xs) {
      return 10.0;
    } else if (size == sm) {
      return 12.0;
    } else if (size == md) {
      return 14.0;
    } else if (size == xl) {
      return 16.0;
    }
    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    double defaultPadding = label == null ? 0.0 : 26;

    return Material(
      color: Colors.transparent,
      // shape: CircleBorder(),
      child: InkWell(
        onTap: () {
          if (!enabled) return;
          onPressed();
        },
        child: Container(
          width: getWidth(),
          margin: margin ??
              EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
                top: 10.0,
              ),
          height: getHeight(),
          decoration: BoxDecoration(
            boxShadow: boxShadow,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: getColor(),
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 30.0)),
              border: Border.all(
                width: outline ? 1.0 : 0.0,
                color: color ?? Colors.transparent,
              ),
            ),
            child: Padding(
              padding: padding ??
                  EdgeInsets.only(
                    left: defaultPadding,
                    right: defaultPadding,
                  ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Icon(
                        icon,
                        color: color == disabledColor
                            ? disabledTextColor
                            : Colors.white,
                        size: 28,
                      ),
                    if (icon != null && label != null)
                      SizedBox(
                        width: 6.0,
                      ),
                    if (label != null)
                      Text(
                        "$label",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: getTextColor(),
                          fontSize: getFontSize(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
