/// Represents the drink category for filtering.
enum DrinkCategory { hot, iced, smoothie, mojito, tea }

/// Immutable data model for a single menu item.
class ItemModel {
  const ItemModel({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });

  final String       image;
  final String       name;
  final String       description;
  final String       price;
  final DrinkCategory category;

  /// Convenience getter used by the Home filter tabs.
  /// true  → appears under "Hot"
  /// false → appears under "Iced"
  bool get isHot => category == DrinkCategory.hot;

  // ─── Menu Data ──────────────────────────────────────────────────────────────
  static const List<ItemModel> items = [
    ItemModel(
      image:       '1.png',
      name:        'Iced Caramel Macchiato',
      description: 'Espresso layered with milk and golden caramel drizzle',
      price:       '25',
      category:    DrinkCategory.iced,
    ),
    ItemModel(
      image:       '2.png',
      name:        'Vanilla Cold Brew',
      description: 'Smooth cold brew infused with sweet vanilla syrup',
      price:       '35',
      category:    DrinkCategory.iced,
    ),
    ItemModel(
      image:       '3.png',
      name:        'Mocha Frappé',
      description: 'Rich chocolate blended with icy espresso and cream',
      price:       '22',
      category:    DrinkCategory.iced,
    ),
    ItemModel(
      image:       '4.png',
      name:        'Cookies & Cream Shake',
      description: 'Creamy milkshake loaded with crunchy cookie bites',
      price:       '40',
      category:    DrinkCategory.smoothie,
    ),
    ItemModel(
      image:       '5.png',
      name:        'Hazelnut Iced Latte',
      description: 'Velvety iced latte with a rich hazelnut twist',
      price:       '15',
      category:    DrinkCategory.iced,
    ),
    ItemModel(
      image:       '6.png',
      name:        'Strawberry Mojito',
      description: 'Fresh strawberries muddled with mint and lime',
      price:       '17',
      category:    DrinkCategory.mojito,
    ),
    ItemModel(
      image:       '9.png',
      name:        'Passion Fruit Iced Tea',
      description: 'Tropical iced tea bursting with fruity passion',
      price:       '18',
      category:    DrinkCategory.tea,
    ),
    ItemModel(
      image:       '7.png',
      name:        'Blueberry Lemonade',
      description: 'Zesty lemonade blended with fresh blueberries',
      price:       '29',
      category:    DrinkCategory.iced,
    ),
    ItemModel(
      image:       '8.png',
      name:        'Mango Smoothie',
      description: 'Creamy sun-ripened mango blended to perfection',
      price:       '36',
      category:    DrinkCategory.smoothie,
    ),
    
  ];
}