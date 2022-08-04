import 'package:flutter/material.dart';

class ImageLoading {
  static getDefault(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }

  static getDefaultLoadingBuilder(
      BuildContext context, Widget child, loadingProgress) {
    return ImageLoading.getDefault(
      context,
      child,
      loadingProgress,
    );
  }
}
