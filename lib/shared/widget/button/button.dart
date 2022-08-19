import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

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
  final bool useShadow;
  final double radius;
  final double? fontSize;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool enabled;
  final bool outline;
  final double? size;

  const ExButton({
    Key? key,
    required this.onPressed,
    this.label,
    this.color,
    this.textColor,
    this.icon,
    this.height = 50,
    this.width,
    this.borderRadius,
    this.boxShadow,
    this.radius = 30.0,
    this.useShadow = false,
    this.fontSize,
    this.margin,
    this.padding,
    this.enabled = true,
    this.outline = false,
    this.size,
  }) : super(key: key);

  getColor(context) {
    if (outline) return Colors.white;
    return enabled ? (color ?? Theme.of(context).primaryColor) : disabledColor;
  }

  getTextColor() {
    if (outline) return color ?? primaryColor;
    if (textColor != null) return textColor;
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
    return height ?? 120.0;
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

  getIconColor() {
    if (outline) return color ?? primaryColor;
    return color == disabledColor ? disabledTextColor : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    double defaultPadding = label == null ? 0.0 : 26;

    return Container(
      width: getWidth() ?? MediaQuery.of(context).size.width,
      height: getHeight(),
      margin: margin ??
          const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
            top: 10.0,
          ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shadowColor: useShadow == true ? null : Colors.transparent,
          primary:
              getColor(context) ?? primaryColor, //background color of button
          side: outline == false
              ? null
              : BorderSide(
                  width: 2,
                  color: (color ?? primaryColor)!,
                ), //border width and color

          elevation: 3, //elevation of button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: getIconColor(),
                  size: 28,
                ),
              if (icon != null && label != null)
                const SizedBox(
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
    );
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
              const EdgeInsets.only(
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
              color: getColor(context),
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
                      const SizedBox(
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
