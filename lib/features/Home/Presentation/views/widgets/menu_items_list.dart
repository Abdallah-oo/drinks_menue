import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/Home/Presentation/helper/animated_list_item.dart';
import 'package:drinks_menue/features/Home/Presentation/views/widgets/item_card.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.items,
    required this.query,
    required this.tabLabel,
  });

  final List<ItemModel> items;
  final String query;
  final String tabLabel;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _EmptyState(query: query, tabLabel: tabLabel);
    }


    return ClipRect(
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: AppSpacing.sm,
          bottom: AppSpacing.xl,
        ),
        clipBehavior: Clip.none,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedListItem(
            index: index,
            child: ItemCard(item: items[index]),
          );
        },
      ),
    );
  }
}

// ─── Empty State ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.query, required this.tabLabel});

  final String query;
  final String tabLabel;

  @override
  Widget build(BuildContext context) {
    final isSearch = query.isNotEmpty;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSearch ? Icons.search_off_rounded : Icons.local_cafe_outlined,
            size: 64,
            color: AppColors.inkDisabled,
          ),
          const SizedBox(height: AppSpacing.md),
          CustomText(
            text: isSearch
                ? 'No results for "$query"'
                : 'No $tabLabel drinks yet',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.ink2,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          CustomText(
            text: isSearch ? 'Try a different keyword' : 'Check back soon!',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
