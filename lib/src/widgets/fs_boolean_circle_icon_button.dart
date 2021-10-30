import 'package:flutter/material.dart';

/// Used to set the properties of the icons of the [FSBooleanCircleIconButton]
class FSBooleanIconData {
  /// Icon description.
  final IconData iconData;

  /// Color of the icon.
  final Color? iconColor;

  /// Will use as the background color of the [FSBooleanCircleIconButton],
  /// when the icon which uses this iconData displays.
  final Color? bgColor;

  FSBooleanIconData({
    required this.iconData,
    this.iconColor,
    this.bgColor,
  });
}

class FSBooleanCircleIconButton extends StatelessWidget {
  /// Define how the icon will look like when [isActive] is true.
  final FSBooleanIconData activeData;

  /// Define how the icon will look like when [isActive] is false.
  final FSBooleanIconData inactiveData;

  /// Empty space in between the icon and the widget circle.
  final EdgeInsets padding;

  /// Empty space around the entire widget.
  final EdgeInsets margin;

  /// Size of the icon; Applies to both the active and inactive state.
  final double? size;

  /// Whether the icon is active or not.
  /// The look of the icon changes based on this value.
  final bool isActive;

  /// The click effect in the button will be diabled if [disableClickEffect]
  /// is true
  ///
  /// default: false
  final bool disableClickEffect;

  /// Callback method to be triggered everytime the user clicks the button
  ///
  /// Change the [isActive] value in here to update the icon
  ///
  /// E.g.:-
  /// FSBooleanCircleIconButton(
  ///   ...
  ///   onTap: () => setState(() => isActive = !isActive),
  ///   ...
  /// ),
  final void Function() onTap;

  const FSBooleanCircleIconButton({
    Key? key,
    required this.isActive,
    required this.activeData,
    required this.inactiveData,
    required this.onTap,
    this.size,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(8.0),
    this.disableClickEffect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color shColor =
        disableClickEffect ? Colors.transparent : Colors.black12;

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: isActive
          ? activeData.bgColor ?? Colors.black12
          : inactiveData.bgColor ?? Colors.black12,
      child: InkWell(
        splashColor: shColor,
        highlightColor: shColor,
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: padding,
          child: Icon(
            isActive ? activeData.iconData : inactiveData.iconData,
            color: isActive ? activeData.iconColor : inactiveData.iconColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
