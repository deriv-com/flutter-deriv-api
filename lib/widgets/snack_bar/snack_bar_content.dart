import 'package:flutter/material.dart';

/// The content of snack bar
class SnackBarContent extends StatelessWidget {
  ///
  const SnackBarContent({
    this.title = '',
    this.subtitle = '',
    this.backgroundColor,
    this.titleStyle = const TextStyle(fontSize: 16),
    this.subtitleStyle = const TextStyle(fontSize: 12),
  });

  /// title of snack bar
  final String title;

  /// subtitle
  final String subtitle;

  ///background color
  final Color backgroundColor;

  ///
  final TextStyle titleStyle;

  ///
  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: backgroundColor ?? Colors.redAccent,
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
          title: title != null
              ? Text(
                  title,
                  style: titleStyle,
                )
              : null,
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: subtitleStyle,
                )
              : null,
        ),
      );
}
