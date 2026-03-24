import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/Cart/Presentation/Views/cart_view.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar();

  static String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning ☀️';
    if (hour < 17) return 'Good afternoon 🌤️';
    return 'Good evening 🌙';
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartProvider>().itemCount;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pagePadding,
        AppSpacing.lg,
        AppSpacing.pagePadding,
        0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: greeting, style: AppTextStyles.bodyMedium),

                const SizedBox(height: AppSpacing.xs),
                CustomText(text: ' Menu', style: AppTextStyles.displayMedium),
              ],
            ),
          ),
          _cartButton(cartCount: cartCount, context: context),
        ],
      ),
    );
  }

  Widget _cartButton({required int cartCount, required BuildContext context}) {
    final cartProvider = context.watch<CartProvider>();
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) =>  ChangeNotifierProvider.value(value: cartProvider,child: CartView())),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset("assets/other/cart.png", width: 30),
          if (cartCount > 0)
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: CustomText(
                  text: '$cartCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                  align: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
