import 'package:drinks_menue/class/addprovider.dart';
import 'package:drinks_menue/class/card.dart';
import 'package:drinks_menue/widgets/cafu_itemes/item.dart';
import 'package:drinks_menue/Animation/scrollanimation/animated_list_item.dart';
import 'package:drinks_menue/screens/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cafue extends StatefulWidget {
  const Cafue({super.key});

  @override
  State<Cafue> createState() => _CafueState();
}

class _CafueState extends State<Cafue> {
  
  @override
  Widget build(BuildContext context) {
    final instanceorder = Provider.of<Addprovider>(context);
    final numItem = instanceorder.orders.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),

        surfaceTintColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Order()),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset("assets/other/cart.png", height: 30, width: 30),
                numItem == 0
                    ? SizedBox.shrink()
                    : Positioned(
                        bottom: 4,
                        right: 20,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Text(
                            "$numItem",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(width: 20),
        ],
        title: Text(
          "Menu",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                clipBehavior: Clip.none,
                itemCount: Drink.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = Drink.products[index];
                  return AnimatedListItem(
                    index: index,
                    child: Item(product: product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
