import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:flutter/material.dart';

class DrinkName extends StatelessWidget {
  const DrinkName({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: item.name, style: AppTextStyles.titleLarge),
        const SizedBox(height: AppSpacing.xs),
        CustomText(
          text: item.description,
          maxLines: 1,
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}
