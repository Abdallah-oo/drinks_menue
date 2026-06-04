import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchases extends StatelessWidget {
  const Purchases({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    if (cart.drinks.isEmpty) return const _EmptyCartView();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: cart.drinks.length,
      itemBuilder: (context, index) {
        return _OrderCard(drink: cart.drinks[index], cart: cart);
      },
    );
  }
}

// ─── Empty State ──────────────────────────────────────────────────────────────

class _EmptyCartView extends StatelessWidget {
  const _EmptyCartView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 72, color: AppColors.ink2),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.ink2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some drinks to get started!',
            style: TextStyle(fontSize: 14, color: AppColors.ink2),
          ),
        ],
      ),
    );
  }
}

// ─── Order Card ───────────────────────────────────────────────────────────────

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.drink, required this.cart});
  final DrinkEntry drink;
  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowMedium,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              _drinkThumbnail(drink: drink),
              const SizedBox(width: 12),
              Expanded(child: _drinkInfo(drink: drink)),
              _controll(drink: drink, cart: cart),
            ],
          ),
        ),
      ),
    );
  }

  ///widgets
  //DrinkThumbnail Widget
  Widget _drinkThumbnail({required DrinkEntry drink}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              'assets/img/${drink.drink.image}',
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (drink.quantity > 1)
          Positioned(
            top: -6,
            right: -6,
            child: Container(
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: CustomText(
                text: '${drink.quantity}',
                align: TextAlign.center,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.surface,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
      ],
    );
  }

  //order info widget
  Widget _drinkInfo({required DrinkEntry drink}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: drink.drink.name,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _tag(
              label: drink.drink.isHot ? 'Hot' : 'Cold',
              color: !drink.drink.isHot
                  ? const Color(0xFF2196F3)
                  : const Color(0xFFFF7043),
            ),
            const SizedBox(width: 6),
            _tag(label: drink.size, color: AppColors.primary),
          ],
        ),
      ],
    );
  }

  //custom widget for _drinkInfo widget

  Widget _tag({required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  // amount controll
  Widget _controll({required DrinkEntry drink, required CartProvider cart}) {
    final unitPrice = double.tryParse(drink.drink.price) ?? 0.0;
    final total = (unitPrice * drink.quantity).toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Remove entirely
        GestureDetector(
          onTap: () => cart.removeDrink(drink.key),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.close_rounded,
              color: AppColors.error,
              size: 14,
            ),
          ),
        ),
        const SizedBox(height: 6),

        // Total price for this entry
        CustomText(
          text: '€ $total',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 6),

        // +/− stepper
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _minBtn(
                icon: drink.quantity == 1
                    ? Icons.delete_outline_rounded
                    : Icons.remove_rounded,
                color: drink.quantity == 1 ? AppColors.error : AppColors.ink2,
                onTap: () => cart.decreaseQty(drink.key),
              ),
              SizedBox(
                width: 28,
                child: CustomText(
                  text: '${drink.quantity}',
                  align: TextAlign.center,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.ink,
                  ),
                ),
              ),
              _minBtn(
                icon: Icons.add_rounded,
                color: AppColors.primary,
                onTap: () => cart.increaseQty(drink.key),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //   custom quantity btn for _controll widget

  Widget _minBtn({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 28,
        height: 28,
        child: Icon(icon, color: color, size: 16),
      ),
    );
  }
}
