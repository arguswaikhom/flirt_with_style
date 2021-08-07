import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';

class FSCircleAvatarData {
  final double? radius;
  final Widget? child;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final ImageProvider? backgroundImage;
  final ImageProvider? foregroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final GestureTapCallback? onClick;

  FSCircleAvatarData({
    this.onClick,
    double this.radius = kFSCircleAvatarRadius,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.foregroundColor,
  });
}
