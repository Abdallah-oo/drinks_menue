import 'dart:math' as math;

import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/core/utils/app_spacing.dart';
import 'package:drinks_menue/core/utils/app_text_style.dart';
import 'package:drinks_menue/core/utils/custom_text.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/addprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

const List<Color> _kBgTints = [
  Color(0xFFEAF7EE),
  Color(0xFFEAF3FF),
  Color(0xFFFFF4EA),
  Color(0xFFFFEAEA),
  Color(0xFFEAFFF7),
  Color(0xFFF5EAFF),
  Color(0xFFFFFBEA),
  Color(0xFFEAF7EE),
  Color(0xFFEAF3FF),
  Color(0xFFFFF4EA),
  Color(0xFFFFEAEA),
  Color(0xFFEAFFF7),
  Color(0xFFF5EAFF),
  Color(0xFFFFFBEA),
  Color(0xFFEAF7EE),
  Color(0xFFEAF3FF),
  Color(0xFFFFF4EA),
  Color(0xFFFFEAEA),
];

Color _tintFor(int index) => _kBgTints[index % _kBgTints.length];

// ─────────────────────────────────────────────────────────────────────────────
// ROOT WIDGET
// ─────────────────────────────────────────────────────────────────────────────

class ItemDetailsViewBody extends StatefulWidget {
  const ItemDetailsViewBody({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<ItemDetailsViewBody> createState() => _ItemDetailsViewBodyState();
}

class _ItemDetailsViewBodyState extends State<ItemDetailsViewBody> {
  static const List<ItemModel> _items = ItemModel.items;
  static const List<String> _sizeLabels = ['small', 'medium', 'large'];

  late final PageController _pageController;
  double _currentPage = 0;
  int _sizeIndex = 0;
  int _quantity = 1;
  bool _isAdding = false;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex.toDouble();

    _pageController =
        PageController(initialPage: widget.initialIndex, viewportFraction: 0.50)
          ..addListener(() {
            setState(() => _currentPage = _pageController.page ?? _currentPage);
          });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _addToCart() {
    if (_isAdding) return;
    final cart = Provider.of<CartProvider>(context, listen: false);
    final item = _items[_currentPage.round()];
    cart.addItem(
      product: item,
      quantity: _quantity,
      type: item.isHot ? 'hot' : 'iced',
      size: _sizeLabels[_sizeIndex],
    );
    setState(() => _isAdding = true);
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (mounted) setState(() => _isAdding = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int current = _currentPage.round();
    final ItemModel item = _items[current];
    final Color bgTint = _tintFor(current);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          color: bgTint,
          child: SafeArea(
            child: Column(
              children: [
                // ── 1. Top bar ───────────────────────────────────────────
                _TopBar(current: current, total: _items.length),

                // ── 2. Drink stage (fan carousel) ────────────────────────
                Expanded(
                  flex: 52,
                  child: _drink(
                    drinks: _items,
                    controller: _pageController,
                    currunt: _currentPage,
                  ),
                ),

                // ── 3. Page dots ─────────────────────────────────────────
                _PageDots(count: _items.length, current: _currentPage),
                const SizedBox(height: AppSpacing.md),

                // ── 4. Info panel ────────────────────────────────────────
                _InfoPanel(
                  item: item,
                  pageFrac: _currentPage,
                  sizeIndex: _sizeIndex,
                  quantity: _quantity,
                  isAdding: _isAdding,
                  onSize: (i) => setState(() => _sizeIndex = i),
                  onQty: (v) => setState(() => _quantity = v),
                  onAdd: _addToCart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TOP BAR
// ─────────────────────────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  const _TopBar({required this.current, required this.total});
  final int current, total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pagePadding,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Back button ─────────────────────────────────────────────────
          _CircleBtn(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),

          // ── Counter pill ────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs + 1,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.70),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CustomText(
              text: '${current + 1}  /  $total',
              style: AppTextStyles.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  const _CircleBtn({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      shadowColor: const Color(0x22000000),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm + 2),
          child: Icon(icon, size: 17, color: AppColors.ink),
        ),
      ),
    );
  }
}

Widget _drink({required List<ItemModel> drinks,required PageController controller,required double currunt,}) {
    double drinkSize = 1.2;
  return PageView.builder(
    controller: controller,
    itemCount: drinks.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      final scale = drinkSize - (currunt - index).abs() * 1;
      final translateY = (currunt - index).abs() * 380;
      return Transform.translate(
        offset: Offset(translateY, 0),
        child: Transform.scale(
          scale: scale.clamp(0.5, 1.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset("assets/img/${drinks[index].image}", height: 350),
                  Positioned(
                    bottom: -20,
                    right: 0,
                    left: 0,
                    child: Image.asset("assets/img/shadow.png"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ], 
          ),
        ),
      );
    },
  );
}
// ─────────────────────────────────────────────────────────────────────────────
// PAGE DOTS
// ─────────────────────────────────────────────────────────────────────────────

class _PageDots extends StatelessWidget {
  const _PageDots({required this.count, required this.current});
  final int count;
  final double current;

  static const int _visible = 7;

  @override
  Widget build(BuildContext context) {
    final int cur = current.round();
    final int half = _visible ~/ 2;
    final int start = (cur - half).clamp(0, math.max(0, count - _visible));
    final int end = (start + _visible).clamp(0, count);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = start; i < end; i++) ...[
            AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeInOut,
              width: i == cur ? 24 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: i == cur ? AppColors.primary : AppColors.inkDisabled,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
            ),
            if (i < end - 1) const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// INFO PANEL  — the white bottom sheet
// ─────────────────────────────────────────────────────────────────────────────

class _InfoPanel extends StatelessWidget {
  const _InfoPanel({
    required this.item,
    required this.pageFrac,
    required this.sizeIndex,
    required this.quantity,
    required this.isAdding,
    required this.onSize,
    required this.onQty,
    required this.onAdd,
  });

  final ItemModel item;
  final double pageFrac;
  final int sizeIndex;
  final int quantity;
  final bool isAdding;
  final ValueChanged<int> onSize;
  final ValueChanged<int> onQty;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
                  child: _NameBlock(
                    key: ValueKey(pageFrac.round()),
                    item: item,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 260),
                child: _PriceBadge(
                  key: ValueKey('p_${pageFrac.round()}'),
                  price: item.price,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),
          const Divider(height: 1, color: AppColors.surfaceAlt),
          const SizedBox(height: AppSpacing.md),

          // ── Size ─────────────────────────────────────────────────────────
          _SizeRow(selected: sizeIndex, onChanged: onSize),
          const SizedBox(height: AppSpacing.md),

          // ── Quantity ─────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Quantity', style: AppTextStyles.titleMedium),
              _QuantityRow(value: quantity, onChanged: onQty),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── CTA ──────────────────────────────────────────────────────────
          _AddToCartBtn(isAdding: isAdding, onTap: onAdd),
        ],
      ),
    );
  }
}

// ─── Name Block ───────────────────────────────────────────────────────────────

class _NameBlock extends StatelessWidget {
  const _NameBlock({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: item.name,
          maxLines: 1,
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: AppSpacing.xs),
        CustomText(
          text: item.description,
          maxLines: 2,
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}

// ─── Price Badge ─────────────────────────────────────────────────────────────

class _PriceBadge extends StatelessWidget {
  const _PriceBadge({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
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

// ─── Size Row ─────────────────────────────────────────────────────────────────

class _SizeRow extends StatelessWidget {
  const _SizeRow({required this.selected, required this.onChanged});
  final int selected;
  final ValueChanged<int> onChanged;

  static const _opts = [
    (label: 'S', h: 16.0),
    (label: 'M', h: 20.0),
    (label: 'L', h: 24.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: 'Size', style: AppTextStyles.titleMedium),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(_opts.length, (i) {
              final opt = _opts[i];
              final bool sel = selected == i;
              return GestureDetector(
                onTap: () => onChanged(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.only(right: AppSpacing.sm),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: sel ? AppColors.primary : AppColors.surfaceAlt,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    boxShadow: sel
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.28),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : [],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/other/vector.svg',
                        height: opt.h,
                        colorFilter: ColorFilter.mode(
                          sel ? Colors.white : AppColors.inkSecondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      CustomText(
                        text: opt.label,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: sel ? Colors.white : AppColors.inkSecondary,
                          fontWeight: sel ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ─── Quantity Row ─────────────────────────────────────────────────────────────

class _QuantityRow extends StatelessWidget {
  const _QuantityRow({required this.value, required this.onChanged});
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QtyBtn(
            icon: Icons.remove_rounded,
            active: value > 1,
            onTap: () => onChanged(value - 1),
          ),
          SizedBox(
            width: 38,
            child: CustomText(
              text: '$value',
              align: TextAlign.center,
              style: AppTextStyles.titleMedium,
            ),
          ),
          _QtyBtn(icon: Icons.add_rounded, onTap: () => onChanged(value + 1)),
        ],
      ),
    );
  }
}

class _QtyBtn extends StatelessWidget {
  const _QtyBtn({required this.icon, required this.onTap, this.active = true});
  final IconData icon;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
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
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}

// ─── Add To Cart Button ───────────────────────────────────────────────────────

class _AddToCartBtn extends StatelessWidget {
  const _AddToCartBtn({required this.isAdding, required this.onTap});
  final bool isAdding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAdding ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          color: isAdding ? AppColors.primaryDark : AppColors.primary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.32),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 240),
              child: isAdding
                  ? const Icon(
                      Icons.check_rounded,
                      key: ValueKey('chk'),
                      color: Colors.white,
                      size: 22,
                    )
                  : const Icon(
                      Icons.shopping_bag_outlined,
                      key: ValueKey('bag'),
                      color: Colors.white,
                      size: 20,
                    ),
            ),
            const SizedBox(width: AppSpacing.sm),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 240),
              child: CustomText(
                key: ValueKey(isAdding),
                text: isAdding ? 'Added to Cart  ✓' : 'Add to Cart',
                style: AppTextStyles.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
