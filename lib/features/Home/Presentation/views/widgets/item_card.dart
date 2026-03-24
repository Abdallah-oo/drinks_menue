import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_shadows.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/views/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemModel item;

  void _openDetails(BuildContext context) {
    final cartProvider = context.read<CartProvider>();
    final index = ItemModel.items.indexOf(item);

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, _) => ChangeNotifierProvider.value(
          value: cartProvider,
          child: ItemDetailsView(initialIndex: index),
        ),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pagePadding,
        vertical: AppSpacing.md,
      ),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          _openDetails(context);
        },
        child: Container(
          height: 135,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            boxShadow: AppShadows.card,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _CardContent(item: item),
              _DrinkImage(imageName: item.image),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Card Content ──────────────────────────────────────────────────────────────
Widget _CardContent({required ItemModel item}) {
  return Padding(
    // Left padding reserves space for the overflowing drink image
    padding: const EdgeInsets.only(
      left: 128,
      right: AppSpacing.md,
      top: AppSpacing.md,
      bottom: AppSpacing.md,
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: item.name,
                maxLines: 1,

                style: AppTextStyles.titleMedium,
              ),

              const SizedBox(height: AppSpacing.xs),
              CustomText(
                text: item.description,
                maxLines: 1,

                style: AppTextStyles.bodySmall,
              ),

              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  _PriceChip(price: item.price),
                  Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 17,
                    color: AppColors.tabTextUnselected,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
      ],
    ),
  );
}

// ─── Price Chip ────────────────────────────────────────────────────────────────
Widget _PriceChip({required String price}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.sm + 2,
      vertical: AppSpacing.xs - 1,
    ),
    decoration: BoxDecoration(
      color: AppColors.primaryLight,
      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
    ),
    child: CustomText(text: '€ $price', style: AppTextStyles.price),
  );
}

// ─── Drink Image ───────────────────────────────────────────────────────────────
Widget _DrinkImage({required String imageName}) {
  return Positioned(
    left: 0,
    top: -30,

    width: 75,
    child: Hero(
      tag: 'drink_$imageName',
      child: Image.asset('assets/img/$imageName', fit: BoxFit.contain),
    ),
  );
}
