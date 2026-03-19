import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// A smart text widget that:
/// - Auto-detects RTL (Arabic) vs LTR direction
/// - Auto-sizes font down to [minFontSize] before truncating
/// - Always clips with ellipsis to prevent overflow
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.align,
    this.maxLines,
    this.minFontSize,
    this.decoration,
  });

  final String        text;
  final TextStyle?    style;
  final TextAlign?    align;
  final int?          maxLines;
  final double?       minFontSize;
  final TextDecoration? decoration;

  static TextDirection _directionOf(String text) {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign:     align,
      textDirection: _directionOf(text),
      maxLines:      maxLines ?? 1,
      minFontSize:   minFontSize ?? 8,
      overflow:      TextOverflow.ellipsis,
      style:         decoration != null
          ? (style ?? const TextStyle()).copyWith(decoration: decoration)
          : style,
    );
  }
}