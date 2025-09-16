import 'package:drinks_menue/Animation/arrow.dart';
import 'package:drinks_menue/class/card.dart';
import 'package:drinks_menue/screens/details.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.product});
  final Drink product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: double.infinity,
            height: 130,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,10,5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 140), // Space for the positioned image
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.description,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color.fromARGB(255, 36, 35, 35),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PulsingArrow(
                    onTap: () {
                      final index = Drink.products.indexOf(product);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(initialIndex: index),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 1,
          child: SizedBox(
            width: 140,
            height: 120,
            child: Image.asset(
              "assets/img/${product.image}",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
