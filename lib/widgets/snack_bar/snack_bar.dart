import 'package:flutter/material.dart';

import './snack_bar_content.dart';
import 'top_snack_bar/top_snack_bar.dart';
import 'top_snack_bar/top_snack_bar_manager.dart';

/// Calls snack bar appropriate classes based on [position]
class SnackBarNotification {
  /// Initializes
  SnackBarNotification(
    this.context, {
    this.snackBarBehavior,
    this.title,
    this.subtitle,
    this.duration = const Duration(seconds: 5),
    this.backgroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.position = SnackBarPosition.bottom,
  });

  /// BuildContext of and [Scaffold]
  final BuildContext context;

  /// To show snackBar above the FAB and other widgets in the scaffold while the
  /// position is set to [SnackBarPosition.bottom]
  /// you should use [SnackBarBehavior.floating]
  final SnackBarBehavior snackBarBehavior;

  /// title of snack bar
  final String title;

  /// subtitle of snack bar
  final String subtitle;

  /// The duration that snack bar content is visible
  final Duration duration;

  /// [SnackBarContent] background color
  final Color backgroundColor;

  /// Title text style
  final TextStyle titleStyle;

  /// Subtitle text style
  final TextStyle subtitleStyle;

  /// Snack bar position, either [SnackBarPosition.top]
  /// or [SnackBarPosition.bottom]
  final SnackBarPosition position;

  /// shows appropriate snack bar based on the [position] specified
  void show() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (position == SnackBarPosition.bottom) {
        Scaffold.of(context).showSnackBar(
          _buildSnackBar(),
        );
      } else {
        TopSnackBarManager().showSnackBar(
          _buildTopSnackBar(),
        );
      }
    });
  }

  SnackBar _buildSnackBar() => SnackBar(
        backgroundColor: Colors.transparent,
        behavior: snackBarBehavior ?? SnackBarBehavior.fixed,
        content: SnackBarContent(
          title: title,
          subtitle: subtitle,
          titleStyle: titleStyle,
          subtitleStyle: subtitleStyle,
          backgroundColor: backgroundColor,
        ),
        duration: duration,
      );

  TopSnackBar _buildTopSnackBar() => TopSnackBar(
        context,
        Scaffold.of(context),
        title: title,
        subtitle: subtitle,
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
        duration: duration,
        dismissible: true,
      );
}

/// Defines the snack bar position
enum SnackBarPosition {
  /// Revealing from top of screen
  top,

  /// Revealing from bottom of screen
  bottom,
}
