import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';

class FSRing extends StatelessWidget {
  final Color color;
  final double radius;
  final double strokeWidth;

  const FSRing({
    Key? key,
    this.color = Colors.blueAccent,
    this.radius = kFSCircleAvatarRadius,
    this.strokeWidth = kFSCircleAvatarRingStrokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.radius * 2,
      width: this.radius * 2,
      child: CustomPaint(
        painter: FSRingPainter(
          color: this.color,
          strokeWidth: this.strokeWidth,
        ),
      ),
    );
  }
}
