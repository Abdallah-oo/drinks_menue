import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
  const AnimatedListItem({
    super.key,
    required this.index,
    required this.child,
  });

  final int    index;
  final Widget child;

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double>   _opacity;

  // Each item waits 55 ms more than the previous one.
  // Clamped at 400 ms so a long list doesn't stall on screen.
  static const int _staggerMs    = 55;
  static const int _maxStaggerMs = 400;
  static const int _durationMs   = 380;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync:    this,
      duration: const Duration(milliseconds: _durationMs),
    );

    // easeIn for opacity: starts invisible, accelerates into full visibility.
    // Feels like the item materialises rather than flying in.
    _opacity = CurvedAnimation(
      parent: _ctrl,
      curve:  Curves.easeIn,
    );

    final delay = Duration(
      milliseconds: (widget.index * _staggerMs).clamp(0, _maxStaggerMs),
    );

    Future.delayed(delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _opacity, child: widget.child);
  }
}