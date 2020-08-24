import 'package:flutter/material.dart';

/// The content of snack bar
class SnackBarContent extends StatelessWidget {
  /// Initializes
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

  /// Title text style
  final TextStyle titleStyle;

  /// Subtitle text style
  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: backgroundColor ?? Colors.redAccent,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
