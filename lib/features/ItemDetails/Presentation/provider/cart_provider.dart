import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:flutter/widgets.dart';


class OrderEntry {
  const OrderEntry({
    required this.product,
    required this.type,
    required this.size,
  });

  final ItemModel product;
  final String type; 
  final String size; 
}


class CartProvider extends ChangeNotifier {
  final List<OrderEntry> _orders = [];


  List<OrderEntry> get orders => List.unmodifiable(_orders);


  int get itemCount => _orders.length;


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


  void removeItem(int index) {
    if (index < 0 || index >= _orders.length) return;
    _orders.removeAt(index);
    notifyListeners();
  }


  double get totalPrice {
    return _orders.fold(0.0, (sum, entry) {
      final price = double.tryParse(entry.product.price) ?? 0.0;
      return sum + price;
    });
  }


  void clearCart() {
    _orders.clear();
    notifyListeners();
  }
}