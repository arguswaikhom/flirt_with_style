import 'dart:math' as math;

import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';

class FSRingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  FSRingPainter({
    this.color = Colors.blueAccent,
    this.strokeWidth = kFSCircleAvatarRingStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    //Paint to draw ring shape
    Paint paint = Paint()
      ..color = this.color
      ..strokeWidth = this.strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //defining Center of Box
    Offset center = Offset(width / 2, height / 2);

    //defining radius
    double radius = math.min(width / 2, height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
