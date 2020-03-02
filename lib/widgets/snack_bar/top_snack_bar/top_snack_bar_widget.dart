import 'package:flutter/material.dart';

import 'top_snack_bar.dart';

/// Uses the [TopSnackBarAnimationController] to animate its [child]
class TopSnackBarWidget extends StatefulWidget {
  ///
  const TopSnackBarWidget({
    Key key,
    @required this.child,
    @required this.snackAnimationController,
    @required this.contextWidth,
    this.dismissible,
    this.duration,
  }) : super(key: key);

  /// Snack bar content
  final Widget child;

  /// Snack bar controller
  final TopSnackBarAnimationController snackAnimationController;

  /// Available with to show the snack bar
  final double contextWidth;

  /// Duration of snack bar being visible
  final Duration duration;

  ///If false, user will be able to dismiss it by dragging up
  ///If true, will remain shown until you dismiss it with [TopSnackBarManager]
  ///dismiss method.
  final bool dismissible;

  @override
  _TopSnackBarWidgetState createState() => _TopSnackBarWidgetState();
}

class _TopSnackBarWidgetState extends State<TopSnackBarWidget> {
  final GlobalKey _snackBarContentKey =
      GlobalKey(debugLabel: 'snackBarContentKey');
  Size _widgetSize;
  bool _dismissible;
  Duration _duration;

  void _calculateSizes() {
    final RenderBox renderBoxRed =
        _snackBarContentKey.currentContext.findRenderObject();
    _widgetSize = renderBoxRed.size;
  }

  @override
  void initState() {
    super.initState();

    _dismissible = widget.dismissible ?? true;
    _duration = widget.duration ?? const Duration(seconds: 2);

    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateSizes());

    widget.snackAnimationController.addListener(() {
      setState(() {});
    });

    if (_dismissible) {
      widget.snackAnimationController
          .addStatusListener((AnimationStatus status) async {
        if (status == AnimationStatus.completed) {
          await Future<void>.delayed(_duration);
          widget.snackAnimationController.hide();
        }
      });
    }
  }

  @override
  void dispose() {
    widget.snackAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Positioned(
        left: 0,
        top: 0,
        width: widget.contextWidth,
        child: SafeArea(
          child: Transform.translate(
            offset: Offset(0, -widget.snackAnimationController.verticalOffset),
            child: GestureDetector(
              key: _snackBarContentKey,
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: FractionalTranslation(
                translation: Offset(
                  0,
                  widget.snackAnimationController.verticalTranslationValue,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      );

  void _onPanStart(DragStartDetails dragStartDetails) {
    if (!_dismissible) {
      return;
    }

    widget.snackAnimationController.onPanStart(
      dragStartDetails,
      _widgetSize.height,
    );
  }

  void _onPanUpdate(DragUpdateDetails dragUpdateDetails) {
    if (!_dismissible) {
      return;
    }

    widget.snackAnimationController.onPanUpdate(
      dragUpdateDetails,
      _widgetSize.height,
    );
  }

  void _onPanEnd(DragEndDetails dragEndDetails) {
    if (!_dismissible) {
      return;
    }

    widget.snackAnimationController.onPanEnd(
      dragEndDetails,
      _widgetSize.height,
    );
  }
}
