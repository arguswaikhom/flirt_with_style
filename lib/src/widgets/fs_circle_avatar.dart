import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flirt_with_style/src/models/fs_circle_avatar_ring_status_data.dart';
import 'package:flutter/material.dart';

class FSCircleAvatar extends StatelessWidget {
  /// Data needs to be provided for the [avatar] and [miniStatus]
  /// are almost same as [CircleAvatar].
  /// Uses are also same as [CircleAvatar]

  /// [avatar] is required and it is the the main [CircleAvatar] that's going
  /// to be displayed in the middle.
  final FSCircleAvatarData avatar;

  /// Displays a ring as an indicator around the [avatar]
  final FSCircleAvatarRingStatusData? ringStatus;

  /// Displays a circular [CircleAvatar] alongside the [avatar]
  /// can be use to displayed status of a person or
  /// to provide a meaning to perform some action like change or upload profile.
  final FSCircleAvatarMiniStatusData? miniStatus;

  /// Callback to trigger when click events happens anywhere
  /// on the widget [FSCircleAvatar]
  final GestureTapCallback? onClick;

  const FSCircleAvatar({
    Key? key,
    required this.avatar,
    this.miniStatus,
    this.ringStatus,
    this.onClick,
  }) : super(key: key);

  Widget _getAvatarWidget() {
    return GestureDetector(
      child: CircleAvatar(
        radius: avatar.radius,
        child: avatar.child,
        backgroundColor: avatar.backgroundColor,
        backgroundImage: avatar.backgroundImage,
        foregroundColor: avatar.foregroundColor,
        foregroundImage: avatar.foregroundImage,
        onBackgroundImageError: avatar.onBackgroundImageError,
        onForegroundImageError: avatar.onForegroundImageError,
      ),
      onTap: avatar.onClick,
    );
  }

  Widget _getMiniStatusWidget() {
    if (miniStatus == null) return Wrap();

    /// If the radius of the [miniStatus] isn't provided, consider the radius
    /// as 30% of the [avatar] radius
    final miniStatusRadius = miniStatus!.radius != null
        ? miniStatus!.radius
        : ((24 * avatar.radius!) / 100);

    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: miniStatusRadius,
            backgroundColor: miniStatus!.backgroundColor,
            child: miniStatus!.child,
            backgroundImage: miniStatus!.backgroundImage,
            foregroundColor: miniStatus!.foregroundColor,
            foregroundImage: miniStatus!.foregroundImage,
            onBackgroundImageError: miniStatus!.onBackgroundImageError,
            onForegroundImageError: miniStatus!.onForegroundImageError,
          ),
          miniStatus!.hasBorder
              ? FSRing(
                  radius: miniStatusRadius!,
                  color: miniStatus!.borderColor,
                  strokeWidth: miniStatus!.borderWidth,
                )
              : Wrap()
        ],
      ),
      onTap: miniStatus!.onClick,
    );
  }

  /// If the [miniStatus] alignment isn't provided
  /// [Alignment.bottomRight] is use by default.
  Alignment _getAvatarStackAlignment() {
    return miniStatus != null ? miniStatus!.alignment : Alignment.bottomRight;
  }

  Widget _getRingStatusWidget() {
    if (ringStatus == null) return Wrap();

    return FSRing(
      color: ringStatus!.ringStatusColor,
      strokeWidth: ringStatus!.strokeWidth,
      radius: avatar.radius! + ringStatus!.ringStatusToAvatarGap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          _getRingStatusWidget(),
          Stack(
            alignment: _getAvatarStackAlignment(),
            children: [
              _getAvatarWidget(),
              _getMiniStatusWidget(),
            ],
          ),
        ],
      ),
      onTap: onClick,
    );
  }
}
