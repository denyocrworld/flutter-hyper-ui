import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class ExImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  ExImage(
    this.src, {
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: src,
      placeholder: (context, url) => Container(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 50.0,
          ),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
