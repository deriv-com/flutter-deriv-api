import 'package:flutter/material.dart';

/// Animated message widget
class AnimatedMessage extends StatefulWidget {
  /// Class constructor
  const AnimatedMessage({
    Key key,
    this.child,
    this.animationDuration = const Duration(milliseconds: 400),
  }) : super(key: key);

  /// Child widget
  final Widget child;

  /// Animation duration for scale Transition transition
  final Duration animationDuration;

  @override
  State<StatefulWidget> createState() => _AnimatedMessageState();
}

class _AnimatedMessageState extends State<AnimatedMessage>
    with SingleTickerProviderStateMixin {
  final Tween<double> _tween = Tween<double>(begin: 0.75, end: 1);

  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );

    _scaleAnimation = _tween.animate(_scaleAnimation);

    _controller
      ..addListener(() => setState(() {}))
      ..forward();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      );
}
