import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';

class FSCircleAvatarMiniStatusData extends FSCircleAvatarData {
  final double? radius;
  final bool hasBorder;
  final double borderWidth;
  final Color borderColor;
  final Alignment alignment;

  FSCircleAvatarMiniStatusData({
    this.radius,
    this.hasBorder = false,
    this.borderWidth = 2.0,
    this.borderColor = Colors.white,
    this.alignment = Alignment.bottomRight,
    onClick,
    onBackgroundImageError,
    onForegroundImageError,
    child,
    backgroundColor,
    backgroundImage,
    foregroundImage,
    foregroundColor,
  }) : super(
          onClick: onClick,
          onBackgroundImageError: onBackgroundImageError,
          onForegroundImageError: onForegroundImageError,
          child: child,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          foregroundImage: foregroundImage,
          foregroundColor: foregroundColor,
        );
}
