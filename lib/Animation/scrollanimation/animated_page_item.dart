import 'package:flutter/material.dart';

class CoverFlowItem extends StatelessWidget {
  final PageController controller;
  final int index;
  final Widget child;

  const CoverFlowItem({
    super.key,
    required this.controller,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        double currentPage = controller.hasClients && controller.position.haveDimensions
            ? controller.page ?? controller.initialPage.toDouble()
            : controller.initialPage.toDouble();

        // Calculate the difference from the center page.
        double value = index - currentPage;

        // A more subtle and modern take on the cover flow effect.
        // We avoid heavy translations and focus on a clean rotation and scale.

        // A smaller rotation angle for a cleaner look.
        final double rotationY = value * -0.8; // Radians
        // Items on the side are scaled down slightly.
        final double scale = 1 - (value.abs() * 0.2);
        // Items on the side are also slightly faded.
        final double opacity = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);

        final transform = Matrix4.identity()
          // Add 3D perspective.
          ..setEntry(3, 2, 0.001)
          // Apply the rotation on the Y-axis.
          ..rotateY(rotationY)
          // Scale the item down as it moves away from the center.
          ..scale(scale);

        return Opacity(
          // Apply the fade effect.
          opacity: opacity,
          child: Transform(
            // The transform is applied from the center of the widget.
            alignment: Alignment.center,
            transform: transform,
            child: child,
          ),
        );
      },
    );
  }
}
