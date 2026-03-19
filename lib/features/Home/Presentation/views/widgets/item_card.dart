import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_shadows.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/views/item_details_view.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemModel item;

  void _openDetails(BuildContext context) {
    final index = ItemModel.items.indexOf(item);

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => ItemDetailsView(initialIndex: index),
        transitionsBuilder: (_, animation, __, child) {
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
              _TapRipple(onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _openDetails(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Card Content ──────────────────────────────────────────────────────────────

class _CardContent extends StatelessWidget {
  const _CardContent({required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
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

                const SizedBox(height: AppSpacing.sm),
                _PriceChip(price: item.price),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          const _ArrowIcon(),
        ],
      ),
    );
  }
}

// ─── Price Chip ────────────────────────────────────────────────────────────────

class _PriceChip extends StatelessWidget {
  const _PriceChip({required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
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
}

// ─── Arrow Icon ───────────────────────────────────────────────────────────────

class _ArrowIcon extends StatelessWidget {
  const _ArrowIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: const Icon(
        Icons.arrow_forward_rounded,
        color: AppColors.surface,
        size: 16,
      ),
    );
  }
}

// ─── Drink Image ───────────────────────────────────────────────────────────────

class _DrinkImage extends StatelessWidget {
  const _DrinkImage({required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
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
}

// ─── Tap Ripple ───────────────────────────────────────────────────────────────
// Invisible InkWell layered on top to give the ripple effect on tap
// while keeping the visual design on the Container below.

class _TapRipple extends StatelessWidget {
  const _TapRipple({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          splashColor: AppColors.primary.withOpacity(0.06),
          highlightColor: AppColors.primary.withOpacity(0.04),
        ),
      ),
    );
  }
}
