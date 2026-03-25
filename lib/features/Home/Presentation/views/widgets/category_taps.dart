import 'package:drinks_menue/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';

typedef OnFilterChanged = void Function(String value);

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key, required this.onCategoryChanged});
  final OnFilterChanged onCategoryChanged;

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int selectedIndex = 0;

  static const _tabs = ['All', 'Hot', 'Iced'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
      child: Row(
        children: List.generate(_tabs.length, (i) {
          final isSelected = selectedIndex == i;

          return Padding(
            padding: EdgeInsets.only(right: i != _tabs.length - 1 ? 12 : 0),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() {
                  selectedIndex = i;
                });
                widget.onCategoryChanged(_tabs[i]);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:isSelected
                        ? Colors.black.withOpacity(0.025)
                        : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? Colors.black.withOpacity(0.06)
                        : Colors.white.withOpacity(0.1),
                  ),
              
                ),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 220),
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isSelected
                        ? AppColors.ink
                        : AppColors.ink2,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w500,
                  ),
                  child: CustomText(text: _tabs[i]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
