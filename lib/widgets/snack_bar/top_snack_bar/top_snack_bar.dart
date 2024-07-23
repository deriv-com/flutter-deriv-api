import 'package:flutter/material.dart';

import '../snack_bar_content.dart';
import 'top_snack_bar_widget.dart';

/// creates [OverlayEntry] for [TopSnackBarWidget] and manages adding and
/// removing them to/from [Overlay]
class TopSnackBar {
  /// Initializes
  TopSnackBar(
    this.context,
    this.vsync, {
    this.title,
    this.subtitle,
    this.dismissible,
    this.backgroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.duration,
  }) {
    snackController = _initializeOverlayEntry(context);
  }

  ///TickerProvider for snack bar animation
  final TickerProvider vsync;

  /// title of snack bar
  final String? title;

  /// Subtitle
  final String? subtitle;

  /// If true snack bar won't dismiss until
  final bool? dismissible;

  /// SnackBarContent background color
  final Color? backgroundColor;

  /// Title text style
  final TextStyle? titleStyle;

  /// Subtitle text style
  final TextStyle? subtitleStyle;

  /// [BuildContext] from [Scaffold]
  final BuildContext context;

  /// will be visible for this duration if [dismissible] is true
  final Duration? duration;

  late OverlayEntry _overlayEntry;

  /// TopSnackBar controller
  late TopSnackBarAnimationController snackController;

  /// Adds [_overlayEntry] to the Overlay
  void addToOverlay() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry);
      snackController.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.dismissed) {
          _overlayEntry.remove();
        }
      });
    });
  }

  /// Initializes [OverlayEntry] with its [TopSnackBarWidget]
  TopSnackBarAnimationController _initializeOverlayEntry(BuildContext context) {
    final TopSnackBarAnimationController snackController =
        TopSnackBarAnimationController(vsync);
    final RenderObject? renderBox = context.findRenderObject();
    if (renderBox is RenderBox) {
      _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => TopSnackBarWidget(
          dismissible: dismissible,
          duration: duration,
          snackAnimationController: snackController,
          contextWidth: renderBox.size.width,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: SnackBarContent(
                title: title,
                subtitle: subtitle,
                titleStyle: titleStyle,
                subtitleStyle: subtitleStyle,
                backgroundColor: backgroundColor,
              ),
            ),
          ),
        ),
      );
    }

    return snackController;
  }
}

/// Controls the Snack bar animation state and its vertical position
class TopSnackBarAnimationController extends ChangeNotifier
    with AnimationLocalStatusListenersMixin {
  /// Initializes
  TopSnackBarAnimationController(this.vsync) {
    _addListeners();
  }

  /// TickerProvider required for animation, can be provided by
  /// Scaffold.of(context) on a Scaffold context
  final TickerProvider vsync;

  late Animation<double> _slideAnimation;
  late Animation<double> _dragAnimation;
  AnimationController? _mainAnimationController;
  AnimationController? _dragAnimationController;

  /// For snack bar show/hide animation
  double verticalTranslationValue = -1;

  /// For snack bar pan gesture
  double verticalOffset = 0;

  void _addListeners() {
    _mainAnimationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );
    _slideAnimation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(
        parent: _mainAnimationController!,
        curve: Curves.easeOut,
      ),
    );
    _mainAnimationController?.addListener(() {
      verticalTranslationValue = _slideAnimation.value;
      notifyListeners();
    });
    _mainAnimationController?.addStatusListener((AnimationStatus status) {
      notifyStatusListeners(status);
    });
  }

  /// Callback when pn gesture starts
  void onPanStart(DragStartDetails dragStartDetails, double snackHeight) {}

  /// Gets called during pan gesture
  void onPanUpdate(DragUpdateDetails dragUpdateDetails, double snackHeight) {
    final double deltaY = dragUpdateDetails.delta.dy;
    if (deltaY < 0) {
      verticalOffset -= deltaY;
      notifyListeners();
    }
  }

  /// Gets called when the pan gesture ends
  void onPanEnd(DragEndDetails dragEndDetails, double snackHeight) {
    if (verticalOffset > snackHeight / 3) {
      hide();
    } else {
      _animateBackToShow();
    }
  }

  void _animateBackToShow() {
    _dragAnimationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        verticalOffset = _dragAnimation.value;
        notifyListeners();
      });

    _dragAnimation = Tween<double>(begin: verticalOffset, end: 0).animate(
      CurvedAnimation(
        parent: _dragAnimationController!,
        curve: Curves.easeOut,
      ),
    );
    _dragAnimationController!.forward();
  }

  @override
  void dispose() {
    _mainAnimationController?.dispose();
    _dragAnimationController?.dispose();

    super.dispose();
  }

  @override
  void didRegisterListener() {}

  @override
  void didUnregisterListener() {}

  /// Shows the snack bar
  void show() {
    _mainAnimationController!.forward();
  }

  /// Hides the snack bar
  void hide() {
    if (_mainAnimationController!.status == AnimationStatus.completed ||
        _mainAnimationController!.status == AnimationStatus.forward) {
      _mainAnimationController!.reverse();
    }
  }
}
