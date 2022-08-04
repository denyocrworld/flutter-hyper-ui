import 'package:flutter/material.dart';

class ShadowCard extends StatelessWidget {
  final Widget child;
  final double border;
  const ShadowCard({
    required this.child,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 8),
              spreadRadius: 8)
        ],
      ),
      child: child,
    );
  }
}
