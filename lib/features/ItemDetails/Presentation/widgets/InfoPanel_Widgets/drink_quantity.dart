import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrinkQuantity extends StatelessWidget {
  const DrinkQuantity({super.key, required this.curruntIndex});
final int curruntIndex;
  
  @override
  Widget build(BuildContext context) {
    final provider = context.read<SizeAndQtyProvider>();
    return Selector<SizeAndQtyProvider, int>(
      selector: (_, provider) => provider.getQuantity(curruntIndex),
      builder: (_, quantity, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              CustomText(text: 'Quantity', style: AppTextStyles.titleMedium),
            Container(
              padding: const EdgeInsets.all(AppSpacing.xs),
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //?decrease btn
                  qtyBtn(
                    icon: Icons.remove_rounded,
                    active: quantity > 1,
                    onTap: () => provider.decreaseQty(curruntIndex),
                  ),
                  SizedBox(
                    width: 38,
                    child: CustomText(
                      text: '$quantity',
                      align: TextAlign.center,
                      style: AppTextStyles.titleMedium,
                    ),
                  ),
                  //?increase btn
                  qtyBtn(
                    icon: Icons.add_rounded,
                    onTap: () => provider.increaseQty(curruntIndex)
                    ,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget qtyBtn({
    required IconData icon,
    required VoidCallback onTap,
    bool active = true,
  }) {
    return GestureDetector(
      onTap: active ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: active ? AppColors.primary : AppColors.inkDisabled,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.surface, size: 16),
      ),
    );
  }
}
