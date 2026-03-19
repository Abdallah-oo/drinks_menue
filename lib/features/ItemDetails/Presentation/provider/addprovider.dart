import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:flutter/widgets.dart';

/// Represents a single order entry with its chosen options.
class OrderEntry {
  const OrderEntry({
    required this.product,
    required this.type,
    required this.size,
  });

  final ItemModel product;
  final String type; // 'iced' | 'hot'
  final String size; // 'small' | 'medium' | 'large'
}

/// Global cart state — holds all added [OrderEntry] items
/// and exposes helpers to add, remove, and calculate totals.
class CartProvider extends ChangeNotifier {
  final List<OrderEntry> _orders = [];

  /// Immutable view of current orders.
  List<OrderEntry> get orders => List.unmodifiable(_orders);

  /// Total number of items in the cart.
  int get itemCount => _orders.length;

  /// Adds [quantity] copies of [product] with the given [type] and [size].
  void addItem({
    required ItemModel product,
    required int quantity,
    required String type,
    required String size,
  }) {
    for (int i = 0; i < quantity; i++) {
      _orders.add(OrderEntry(product: product, type: type, size: size));
    }
    notifyListeners();
  }

  /// Removes the order at [index].
  void removeItem(int index) {
    if (index < 0 || index >= _orders.length) return;
    _orders.removeAt(index);
    notifyListeners();
  }

  /// Calculates the total price of all items in the cart.
  double get totalPrice {
    return _orders.fold(0.0, (sum, entry) {
      final price = double.tryParse(entry.product.price) ?? 0.0;
      return sum + price;
    });
  }

  /// Clears all items from the cart.
  void clearCart() {
    _orders.clear();
    notifyListeners();
  }
}