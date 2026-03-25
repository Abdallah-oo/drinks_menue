import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DrinkSize extends StatelessWidget {
  const DrinkSize({super.key, required this.curruntIndex});
  final int curruntIndex;
  static const opts = [
    (label: 'S', h: 16.0),
    (label: 'M', h: 20.0),
    (label: 'L', h: 24.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Selector<SizeAndQtyProvider, int>(
      selector: (_, provider) => provider.getSizeIndex(curruntIndex),
      builder: (_, selectedIndex, _) {
        return Row(
          children: [
            CustomText(text: 'Size', style: AppTextStyles.titleMedium),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(opts.length, (index) {
                  final opt = opts[index];
                  final bool sel = selectedIndex == index;
                  return GestureDetector(
                    onTap: () =>
                        context.read<SizeAndQtyProvider>().setSizeIndex(index: curruntIndex,sizeIndex: index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(right: AppSpacing.sm),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: sel ? AppColors.primary : AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMd,
                        ),
                        boxShadow: sel
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.28),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/other/vector.svg',
                            height: opt.h,
                            colorFilter: ColorFilter.mode(
                              sel ? AppColors.surface : AppColors.ink2,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          CustomText(
                            text: opt.label,
                            style: AppTextStyles.labelMedium.copyWith(
                              color: sel
                                  ? AppColors.surface
                                  : AppColors.ink2,
                              fontWeight: sel
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
