import 'dart:math' as math;

import 'package:drinks_menue/core/extensions/responsive.dart';
import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:flutter/material.dart';

class DrinksDots extends StatelessWidget {
  const DrinksDots({super.key, required this.count, required this.current});
  final int count;
  final double current;

  static const int _visible = 5;
  @override
  Widget build(BuildContext context) {
    final int cur = current.round();
    final int half = _visible ~/ 2;
    final int start = (cur - half).clamp(0, math.max(0, count - _visible));
    final int end = (start + _visible).clamp(0, count);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: context.screenHeight*0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = start; i < end; i++) ...[
            AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeInOut,
              width: i == cur ? 24 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: i == cur ? AppColors.ink2 : AppColors.inkDisabled,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
            ),
            if (i < end - 1) const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }
}
