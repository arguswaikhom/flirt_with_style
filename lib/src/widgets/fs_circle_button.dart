import 'package:flutter/material.dart';

class FSCircleButton extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final GestureTapCallback? onTap;

  const FSCircleButton({
    Key? key,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
