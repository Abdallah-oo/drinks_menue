import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/core/utils/app_spacing.dart';
import 'package:cafe_app/core/utils/app_text_style.dart';
import 'package:cafe_app/core/utils/custom_text.dart';
import 'package:cafe_app/features/Home/Data/item_model.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:cafe_app/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartBtn extends StatefulWidget {
  const AddToCartBtn({
    super.key,
    required this.items,
    required this.curruntIndex,
  });

  final List<ItemModel> items;
  final int curruntIndex;

  @override
  State<AddToCartBtn> createState() => _AddToCartBtnState();
}

class _AddToCartBtnState extends State<AddToCartBtn> {
  static const List<String> _sizeLabels = ['small', 'medium', 'large'];

  ItemModel get _item => widget.items[widget.curruntIndex];

  String _sizeLabel(int sizeIndex) => _sizeLabels[sizeIndex];

  @override
  Widget build(BuildContext context) {
    final sizeIndex = context.select<SizeAndQtyProvider, int>(
      (p) => p.getSizeIndex(widget.curruntIndex),
    );
    final cart = context.watch<CartProvider>();
    final size = _sizeLabel(sizeIndex);
    final isDrinkInCart = cart.isDrinkInCart(_item, size);
    final drink = cart.getDrink(_item, size);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.4),
            end: Offset.zero,
          ).animate(anim),
          child: child,
        ),
      ),
      child: isDrinkInCart
          // ── Already in cart
          ? _CartQtyStepper(
              key: const ValueKey('stepper'),
              drink: drink!,
              cart: cart,
            )
          // ── Not in cart
          : _AddButton(
              key: const ValueKey('add_btn'),
              cart: cart,
              item: _item,
              size: size,

             
            ),
    );
  }
}

// ─── Add Button ───────────────────────────────────────────────────────────────

class _AddButton extends StatelessWidget {
  const _AddButton({super.key, required this.cart, required this.item, required this.size});
  final CartProvider cart;
  final ItemModel item;
  final String size;
  static bool _isPressed = false;
  void _addToCart() {
    if (_isPressed) return;
    cart.addItem(drink: item, quantity: 1, size: size);
    _isPressed = true;
    Future.delayed(const Duration(milliseconds: 400), () {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _addToCart,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.ink1,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.surface,
              size: 18,
            ),
            const SizedBox(width: AppSpacing.md),
            CustomText(text: 'Add to Cart', style: AppTextStyles.labelLarge),
          ],
        ),
      ),
    );
  }
}

class _CartQtyStepper extends StatelessWidget {
  const _CartQtyStepper({super.key, required this.drink, required this.cart});

  final DrinkEntry drink;
  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.ink1.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Decrease / remove ──────────────────────────────────────────
          _stepBtn(
            icon: drink.quantity == 1
                ? Icons.delete_outline_rounded
                : Icons.remove_rounded,
            color: drink.quantity == 1
                ? AppColors.error
                : AppColors.primary,
            onTap: () => cart.decreaseQty(drink.key),
          ),

          // ── Qty label ──────────────────────────────────────────────────
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: '${drink.quantity}',
                style: AppTextStyles.titleMedium,
              ),
              CustomText(
                text: 'in cart',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          // ── Increase ───────────────────────────────────────────────────
          _stepBtn(
            icon: Icons.add_rounded,
            color: AppColors.primary,
            onTap: () => cart.increaseQty(drink.key),
          ),
        ],
      ),
    );
  }

  Widget _stepBtn({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}
