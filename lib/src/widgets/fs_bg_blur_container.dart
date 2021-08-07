import 'dart:ui';

import 'package:flutter/material.dart';

class FSBgBlurContainer extends StatelessWidget {
  final double sigmaXY;
  final double? sigmaX;
  final double? sigmaY;
  final double opacity;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Widget child;
  final Widget? background;
  final Color? backgroundColor;
  final BorderRadius borderRadius;

  const FSBgBlurContainer({
    Key? key,
    required this.child,
    this.sigmaXY = 5.0,
    this.sigmaX,
    this.sigmaY,
    this.opacity = 0.5,
    this.background,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: borderRadius,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: sigmaX ?? sigmaXY,
                  sigmaY: sigmaY ?? sigmaXY,
                ),
                child: Container(
                  color: backgroundColor?.withOpacity(opacity),
                  child: background,
                ),
              ),
            ),
          ),
          Container(
            padding: padding,
            child: child,
          ),
        ],
      ),
    );
  }
}
