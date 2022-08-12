import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class ExImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ExImage(
    this.src, {
    Key? key,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: src,
      placeholder: (context, url) => Container(
        constraints: const BoxConstraints(
          maxWidth: 50.0,
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
