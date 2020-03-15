import 'package:flutter/material.dart';

/// Circular close button widget
class CircularCloseButton extends StatelessWidget {
  /// Class constructor
  const CircularCloseButton({
    Key key,
    this.size,
    this.color,
    this.iconColor,
    this.shadowColor,
    this.onTap,
  }) : super(key: key);

  /// Button size
  final double size;

  /// Button color
  final Color color;

  /// Button icon color
  final Color iconColor;

  /// Button shadow color
  final Color shadowColor;

  /// Button on tap callback
  final Function onTap;

  @override
  Widget build(BuildContext context) => Material(
        shadowColor: shadowColor ?? Colors.transparent,
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.close,
              color: iconColor,
              size: size,
            ),
          ),
          onTap: onTap ?? () => Navigator.of(context).pop(),
        ),
      );
}
