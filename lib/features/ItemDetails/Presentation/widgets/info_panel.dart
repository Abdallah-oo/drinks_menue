import 'package:drinks_menue/core/extensions/responsive.dart';
import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/widgets/InfoPanel_Widgets/add_to_cart_btn.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/widgets/InfoPanel_Widgets/drink_quantity.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/widgets/InfoPanel_Widgets/drink_size.dart';
import 'package:flutter/material.dart';


class InfoPanel extends StatefulWidget {
  const InfoPanel({
    super.key,
    required List<ItemModel> items,
    required this.curruntIndex,
  }) : _items = items;
  final List<ItemModel> _items;

  final int curruntIndex;

  @override
  State<InfoPanel> createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
 

  @override
  Widget build(BuildContext context) {
   
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
        AppSpacing.lg,
        AppSpacing.pagePadding,
        AppSpacing.lg,
      ),
      child: SingleChildScrollView(
        key: PageStorageKey('info_${widget.curruntIndex}'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Drag handle ─────────────────────────────────────────────────
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

            // ── Name + price ─────────────────────────────────────────────────
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
                                begin: const Offset(0.0, 0.05),
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
                      child: nameBlock(
                    
                        item: widget._items[widget.curruntIndex],
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 260),
                    child: priceBadge(
                     
                      price: widget._items[widget.curruntIndex].price,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),
            const Divider(height: 1, color: AppColors.surfaceAlt),
            const SizedBox(height: AppSpacing.md),

            // ── Size ─────────────────────────────────────────────────────────
         DrinkSize(curruntIndex: widget.curruntIndex,),
            const SizedBox(height: AppSpacing.md),

            // ── Quantity ─────────────────────────────────────────────────────
           DrinkQuantity(curruntIndex: widget.curruntIndex,),
            const SizedBox(height: AppSpacing.lg),

            // Add to cart btn
            AddToCartBtn(
              items: widget._items,
              curruntIndex: widget.curruntIndex,
          
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }

  //?Widgets

  //name block widget
  Widget nameBlock({ required ItemModel item}) {
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

  //price badge widget
  Widget priceBadge({ required String price}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: CustomText(
        text: '€ $price',
        style: AppTextStyles.price.copyWith(fontSize: 15),
      ),
    );
  }

 

  
}
