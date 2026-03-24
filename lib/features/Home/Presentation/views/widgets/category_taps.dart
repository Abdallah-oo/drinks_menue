import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:flutter/material.dart';

typedef OnFilterChanged = void Function(String value);

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key, required this.onCategoryChanged});
  final OnFilterChanged onCategoryChanged;

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
 

  static const _tabs = ['All', 'Hot', 'Iced'];
  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
      child: TabBar(
        controller: _tabController,
        isScrollable: false,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        labelPadding: EdgeInsets.zero,
        tabs: List.generate(_tabs.length, (i) {
          return _TabChip(
            label: _tabs[i],
            isSelected: _tabController.index == i,
            onTap: () {
              _tabController.animateTo(i);
              widget.onCategoryChanged(_tabs[i]);
            },
          );
        }),
      ),
    );
  }

  Widget _TabChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(right: AppSpacing.sm),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm - 2,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.tabSelected : AppColors.tabUnselected,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          border: Border.all(color: AppColors.tabBorder, width: 1),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.shadowMedium,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: CustomText(
          text: label,
          style: AppTextStyles.labelMedium.copyWith(
            color: isSelected
                ? AppColors.tabTextSelected
                : AppColors.tabTextUnselected,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
