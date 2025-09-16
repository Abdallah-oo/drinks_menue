import 'package:flutter/material.dart';

class PulsingArrow extends StatefulWidget {
  final VoidCallback onTap;

  const PulsingArrow({super.key, required this.onTap});

  @override
  State<PulsingArrow> createState() => _PulsingArrowState();
}

class _PulsingArrowState extends State<PulsingArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      // A quick, sharp duration for the pulse effect.
      duration: const Duration(milliseconds: 900),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.2, // A slightly larger scale to be more noticeable.
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    // This listener creates a periodic animation that doesn't loop infinitely.
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // After scaling up, scale back down.
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // After the pulse is complete, wait for a few seconds before the next one.
        Future.delayed(const Duration(seconds: 4), () {
          // Check if the widget is still in the tree before animating.
          if (mounted) {
            _controller.forward();
          }
        });
      }
    });

    // Start the animation loop after an initial delay to make the UI feel less busy on load.
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.5,
              color: const Color.fromARGB(255, 184, 180, 180),
            ),
          ),
          child: const Icon(
            Icons.arrow_right_alt,
            color: Color.fromARGB(255, 119, 113, 113),
            size: 22,
          ),
        ),
      ),
    );
  }
}
