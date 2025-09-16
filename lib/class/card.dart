class Drink {
  final String image;
  final String name;
  final String description;
  final String price;

  Drink({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
  static List<Drink> products = [
    Drink(
      image: "1.png",
      name: "Iced Caramel Macchiato",
      description: "A refreshing espresso with golden caramel drizzle",
      price: "25",
    ),

    Drink(
      image: "2.png",
      name: "Vanilla Cold Brew",
      description: "Smooth cold brew infused",
      price: "35",
    ),

    Drink(
      image: "3.png",
      name: "Mocha Frappe",
      description: "Rich chocolate blended with icy espresso",
      price: "22",
    ),

    Drink(
      image: "4.png",
      name: "Cookies & Cream Shake",
      description: "Creamy shake with crunchy cookie bites",
      price: "40",
    ),

    Drink(
      image: "5.png",
      name: "Hazelnut Iced Latte",
      description: "Iced latte with a nutty hazelnut twist",
      price: "15",
    ),

    Drink(
      image: "6.png",
      name: "Strawberry Mojito",
      description: "Fresh strawberries with mint",
      price: "17",
    ),

    Drink(
      image: "7.png",
      name: "Passion Fruit Iced Tea",
      description: "Tropical iced tea with a fruity punch",
      price: "18",
    ),

    Drink(
      image: "8.png",
      name: "Blueberry Lemonade",
      description: "Zesty lemonade blended with blueberries",
      price: "29",
    ),

    Drink(
      image: "9.png",
      name: "Mango Smoothie",
      description: "Creamy tropical mango delight",
      price: "36",
    ),

    Drink(
      image: "10.png",
      name: "Lotus Iced Coffee",
      description: "Chilled coffee with a Lotus cookie flavor",
      price: "26",
    ),

    Drink(
      image: "11.png",
      name: "Peach Iced Tea",
      description: "Refreshing iced tea with sweet peach flavor",
      price: "11",
    ),

    Drink(
      image: "12.png",
      name: "Chocolate Banana Smoothie",
      description: "Creamy blend of banana and rich chocolate",
      price: "19",
    ),

    Drink(
      image: "13.png",
      name: "Chocolate Banana Smoothie",
      description: "Creamy blend of banana and rich chocolate",
      price: "38",
    ),

    Drink(
      image: "14.png",
      name: "Coconut Iced Latte",
      description: "Iced latte with a tropical coconut twist",
      price: "68",
    ),

    Drink(
      image: "15.png",
      name: "Raspberry Lemon Iced Tea",
      description: "Zesty iced tea with a hint ",
      price: "67",
    ),

    Drink(
      image: "16.png",
      name: "Avocado Smoothie",
      description: "Creamy and healthy smoothie with fresh avocado",
      price: "66",
    ),

    Drink(
      image: "17.png",
      name: "Mint Chocolate Frappe",
      description: "Chilled frappe with chocolate and a cool mint touch",
      price: "55",
    ),

    Drink(
      image: "18.png",
      name: "Pineapple Mojito",
      description: "Refreshing mojito with tropical pineapple flavor",
      price: "99",
    ),
  ];
}
