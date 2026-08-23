import 'package:cafe_app/core/extensions/responsive.dart';
import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/add_to_cart_btn.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/drink_name.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/drink_price.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/views/widgets/InfoPanel_Widgets/drink_size.dart';
import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key, required this.curruntIndex, required this.items});

  final List<ItemModel> items;
  final int curruntIndex;

  @override
  Widget build(BuildContext context) {
    final item = items[curruntIndex];

    return Container(
      height: context.screenHeight * 0.3,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 24,
            offset: Offset(0, -6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pagePadding,
        0,
        AppSpacing.pagePadding,
        0,
      ),
      child: SingleChildScrollView(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),

            // ── Drag handle ───────────────────────────────────────────────
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.inkDisabled,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
              ),
            ),

            // ── Name + price ──────────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 260),
                      transitionBuilder: (child, anim) => FadeTransition(
                        opacity: CurvedAnimation(
                          parent: anim,
                          curve: Curves.easeOut,
                        ),
                        child: SlideTransition(
                          position:
                              Tween<Offset>(
                                begin: const Offset(0.0, 0.12),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: anim,
                                  curve: Curves.easeOut,
                                ),
                              ),
                          child: child,
                        ),
                      ),
                      child: DrinkName( item: item),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 260),
                  transitionBuilder: (child, anim) => FadeTransition(
                    opacity: CurvedAnimation(
                      parent: anim,
                      curve: Curves.easeOut,
                    ),
                    child: SlideTransition(
                      position:
                          Tween<Offset>(
                            begin: const Offset(0.0, 0.12),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: anim,
                              curve: Curves.easeOut,
                            ),
                          ),
                      child: child,
                    ),
                  ),
                  child: DrinkPrice(
                    key: ValueKey('p_$curruntIndex'),
                    price: item.price,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),
            const Divider(height: 1, color: AppColors.surfaceAlt),
            const SizedBox(height: AppSpacing.md),

            // ── Size ──────────────────────────────────────────────────────
            DrinkSize(key: PageStorageKey('info_$curruntIndex') ,curruntIndex: curruntIndex),
            SafeArea(
              child: AddToCartBtn(items: items, curruntIndex: curruntIndex),
            ),
          ],
        ),
      ),
    );
  }
}
