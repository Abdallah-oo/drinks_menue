import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:flutter/widgets.dart';

class DrinkEntry {
  DrinkEntry({required this.drink, required this.size, this.quantity = 1});

  final ItemModel drink;

  final String size;
  int quantity;

  static String keyFor(ItemModel product, String size) =>
      '${product.image}_$size';

  String get key => keyFor(drink, size);
}

// ─── Cart Provider ────────────────────────────────────────────────────────────

class CartProvider extends ChangeNotifier {
  final Map<String, DrinkEntry> _drinks = {};

  List<DrinkEntry> get drinks => _drinks.values.toList();

  int get itemCount => _drinks.values.fold(0, (sum, e) => sum + e.quantity);
  // check if drink in cart
  bool isDrinkInCart(ItemModel product, String size) =>
      _drinks.containsKey(DrinkEntry.keyFor(product, size));
  // get drink from cart
  DrinkEntry? getDrink(ItemModel product, String size) =>
      _drinks[DrinkEntry.keyFor(product, size)];
  // add drink to cart
  void addItem({
    required ItemModel drink,
    required int quantity,

    required String size,
  }) {
    final key = DrinkEntry.keyFor(drink, size);
    if (_drinks.containsKey(key)) {
      _drinks[key]!.quantity += quantity;
    } else {
      _drinks[key] = DrinkEntry(
        drink: drink,

        size: size,
        quantity: quantity,
      );
    }
    notifyListeners();
  }

  //increase drink quantity
  void increaseQty(String key) {
    if (!_drinks.containsKey(key)) return;
    _drinks[key]!.quantity++;
    notifyListeners();
  }

  //decrease drink quantity
  void decreaseQty(String key) {
    if (!_drinks.containsKey(key)) return;
    if (_drinks[key]!.quantity <= 1) {
      _drinks.remove(key);
    } else {
      _drinks[key]!.quantity--;
    }
    notifyListeners();
  }

  //remove drink from cart
  void removeDrink(String key) {
    _drinks.remove(key);
    notifyListeners();
  }

  //calculate total price
  double get totalPrice {
    return _drinks.values.fold(0.0, (sum, entry) {
      final price = double.tryParse(entry.drink.price) ?? 0.0;
      return sum + price * entry.quantity;
    });
  }

  //clear cart
  void clearCart() {
    _drinks.clear();
    notifyListeners();
  }
}
