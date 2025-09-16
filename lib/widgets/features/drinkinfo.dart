import 'package:drinks_menue/class/addprovider.dart';
import 'package:drinks_menue/class/card.dart';
import 'package:drinks_menue/widgets/features/amount.dart';
import 'package:drinks_menue/widgets/features/switchdrink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Drinkinfo extends StatefulWidget {
  const Drinkinfo({super.key, required this.selectedsize, required this.currentpage});
  final int selectedsize;
  final double currentpage;
  @override
  State<Drinkinfo> createState() => _DrinkinfoState();
}

class _DrinkinfoState extends State<Drinkinfo> {
  int amount = 1;
  bool isiced = false;
  String size = "small";
  String type = "iced";
  bool _isAdding = false;
  catchsize() {
    switch (widget.selectedsize) {
      case 0:
        size = "small";
        break;
      case 1:
        size = "medium";
        break;
      case 2:
        size = "large";
        break;
    }
  }

  catchtype() {
    if (isiced == true) {
      type = "iced";
    } else {
      type = "hot";
    }
  }

  @override
  Widget build(BuildContext context) {
    final instanceorder = Provider.of<Addprovider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Toggleswitch(
                setsize: (v) {
                  isiced = v;
                },
              ),
              Amount(
                onAmountChanged: (v) {
                  amount = v;
                },
              ),
            ],
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: GestureDetector(
              onTap: () {
                catchsize();
                catchtype();
                instanceorder.additem(
                  Drink.products[widget.currentpage.round()],
                  amount,
                  type,
                  size,
                );
            
                setState(() {
                  _isAdding = true;
                });
                Future.delayed(const Duration(milliseconds: 250), () {
                  if (mounted) {
                    setState(() {
                      _isAdding = false;
                    });
                  }
                });
              },
              child: AnimatedScale(
                duration: const Duration(milliseconds: 500),
                scale: _isAdding ? 0.85 : 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Add To Cart",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset("assets/other/cart.png", height: 20, width: 20),
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
