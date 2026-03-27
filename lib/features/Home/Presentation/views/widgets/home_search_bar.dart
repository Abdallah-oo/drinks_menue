import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

typedef OnFilterChanged = void Function(String value);

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key, required this.onQueryChanged});
  final OnFilterChanged onQueryChanged;

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          onChanged: (value) => widget.onQueryChanged(value),
          controller: _searchController,

          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.ink,
          ),
          decoration: InputDecoration(
            hintText: 'Search drinks...',
            hintStyle: AppTextStyles.bodyMedium,
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.ink2,
              size: 20,
            ),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _searchController,
              builder: (_, value, _) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.ink2,
                    size: 18,
                  ),
                  onPressed: () {
                  _searchController.text = '';
                    _searchController.selection = TextSelection.collapsed(
                      offset: 0,
                    );
                    widget.onQueryChanged('');
                  },
                );
              },
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}
