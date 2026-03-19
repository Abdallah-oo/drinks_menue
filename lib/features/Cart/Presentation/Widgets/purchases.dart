import 'package:drinks_menue/features/ItemDetails/Presentation/provider/addprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchases extends StatelessWidget {
  const Purchases({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    if (cart.orders.isEmpty) {
      return const _EmptyCartView();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: cart.orders.length,
      itemBuilder: (context, index) {
        return _OrderCard(
          entry: cart.orders[index],
          onRemove: () => cart.removeItem(index),
        );
      },
    );
  }
}

// ─── Empty State ───────────────────────────────────────────────────────────────

class _EmptyCartView extends StatelessWidget {
  const _EmptyCartView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart_outlined,
              size: 72, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some drinks to get started!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Order Card ────────────────────────────────────────────────────────────────

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.entry, required this.onRemove});

  final OrderEntry entry;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              _DrinkThumbnail(imageName: entry.product.image),
              const SizedBox(width: 12),
              Expanded(child: _OrderInfo(entry: entry)),
              _PriceAndRemove(
                price: entry.product.price,
                onRemove: onRemove,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Drink Thumbnail ───────────────────────────────────────────────────────────

class _DrinkThumbnail extends StatelessWidget {
  const _DrinkThumbnail({required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Image.asset(
          'assets/img/$imageName',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// ─── Order Info ────────────────────────────────────────────────────────────────

class _OrderInfo extends StatelessWidget {
  const _OrderInfo({required this.entry});

  final OrderEntry entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entry.product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _Tag(
              label: entry.type,
              color: entry.type == 'iced'
                  ? const Color(0xFF2196F3)
                  : const Color(0xFFFF7043),
            ),
            const SizedBox(width: 6),
            _Tag(
              label: entry.size,
              color: const Color(0xFF4CAF50),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Pill Tag ─────────────────────────────────────────────────────────────────

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
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
}

// ─── Price & Remove ───────────────────────────────────────────────────────────

class _PriceAndRemove extends StatelessWidget {
  const _PriceAndRemove({required this.price, required this.onRemove});

  final String price;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onRemove,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.close_rounded,
              color: Color(0xFFE53935),
              size: 14,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '€ $price',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
      ],
    );
  }
}