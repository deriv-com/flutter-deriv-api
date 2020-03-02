import 'dart:collection';

import 'package:flutter/material.dart';

import 'top_snack_bar.dart';

/// A singleton class that manages a queue of [TopSnackBar]s
/// to show them in order (if there are more than one instance in the App
/// at the same time)
class TopSnackBarManager {
  /// Singleton instance
  factory TopSnackBarManager() => _instance ??= TopSnackBarManager._();

  TopSnackBarManager._() : _snackBars = Queue<TopSnackBar>();

  ///A queue of [TopSnackBar]s
  ///If another [TopSnackBar] added to the overlay it will be added to the
  ///[_snackBars] queue and will be shown after dismissing current TopSnackBar
  final Queue<TopSnackBar> _snackBars;

  TopSnackBar _currentTopSnackBar;

  static TopSnackBarManager _instance;

  /// Shows the given [snackBar]
  void showSnackBar(TopSnackBar snackBar, {bool dismissCurrent = false}) {
    if (_currentTopSnackBar == null) {
      snackBar.snackController.addStatusListener(_handleStatusChange);
      _currentTopSnackBar = snackBar;

      if (_snackBars.isEmpty) {
        _showSnackBar();
      }
    } else if (dismissCurrent) {
      _currentTopSnackBar.snackController.hide();
    }
    _snackBars.addLast(snackBar);
  }

  /// Dismisses current [TopSnackBar] if there is any
  void dismissCurrentSnackBar() {
    if (_currentTopSnackBar != null) {
      _currentTopSnackBar.snackController.hide();
    }
    _snackBars.clear();
  }

  void _handleStatusChange(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
        _currentTopSnackBar = null;
        if (_snackBars.isNotEmpty) {
          _snackBars.removeFirst();
          if (_snackBars.isNotEmpty) {
            _snackBars.first.snackController
                .addStatusListener(_handleStatusChange);
            _currentTopSnackBar = _snackBars.first;
            _showSnackBar();
          }
        }
        break;
      case AnimationStatus.completed:
        break;
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        break;
    }
  }

  void _showSnackBar() {
    _currentTopSnackBar.addToOverlay();
    _currentTopSnackBar.snackController.show();
  }
}
