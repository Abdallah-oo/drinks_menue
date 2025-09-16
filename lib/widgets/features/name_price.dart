import 'package:drinks_menue/class/card.dart';
import 'package:flutter/material.dart';

class NameandPrice extends StatefulWidget {
  const NameandPrice({super.key, required this.currentpage});
  final double currentpage;

  @override
  State<NameandPrice> createState() => _NameandPriceState();
}

class _NameandPriceState extends State<NameandPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Using Expanded to prevent overflow if the name is too long
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Drink.products[widget.currentpage.round()].name,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                Drink.products[widget.currentpage.round()].description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  color: const Color.fromARGB(255, 36, 35, 35),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Text(
          "€${Drink.products[widget.currentpage.round()].price}",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
