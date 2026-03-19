import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.radius,
    this.onPressed,
    this.padding,
    required this.child,
    this.color,
    this.borderSide,
    this.elevation,
    this.borderRadiusGeometry,
  });
  final void Function()? onPressed;

  final EdgeInsetsGeometry? padding;
  final Widget child;
  final double radius;
  final Color? color;
  final BorderSide? borderSide;
  final double? elevation;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
    style: ButtonStyle(
  elevation: WidgetStateProperty.all(0),

  backgroundColor: WidgetStateProperty.all(
    color ?? Colors.transparent,
  ),

  overlayColor: WidgetStateProperty.all(Colors.transparent),

  surfaceTintColor: WidgetStateProperty.all(Colors.transparent),

  shadowColor: WidgetStateProperty.all(Colors.transparent),

  padding: WidgetStateProperty.all(
    padding ?? const EdgeInsets.symmetric(vertical: 10),
  ),

  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius:
          borderRadiusGeometry ?? BorderRadius.circular(radius),
      side: borderSide ?? BorderSide.none,
    ),
  ),

  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
),

      child: child,
    );
  }
}
