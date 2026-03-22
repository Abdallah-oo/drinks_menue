import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.current, required this.total});
  final int current, total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pagePadding,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Back button ─────────────────────────────────────────────────
          _CircleBtn(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),

          // ── Counter pill ────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs + 1,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.70),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CustomText(
              text: '${current + 1}  /  $total',
              style: AppTextStyles.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _CircleBtn({required IconData icon, required VoidCallback onTap}) {
     return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      shadowColor: const Color(0x22000000),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm + 2),
          child: Icon(icon, size: 17, color: AppColors.ink),
        ),
      ),
    );
  }
}
