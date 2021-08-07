import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';

class FSCircleAvatarRingStatusData {
  final Color ringStatusColor;
  final double strokeWidth;
  final double ringStatusToAvatarGap;

  FSCircleAvatarRingStatusData({
    this.ringStatusColor = Colors.blueAccent,
    this.strokeWidth = kFSCircleAvatarRingStrokeWidth,
    this.ringStatusToAvatarGap = kFSCircleAvatarRingStatusToAvatarGap,
  });
}
