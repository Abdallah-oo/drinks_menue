import 'package:drinks_menue/core/extensions/responsive.dart';
import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  const Drink({
    super.key,
    required this.drinks,
    required this.controller,
    required this.curruntPage,
  });
  final List<ItemModel> drinks;
  final PageController controller;
  final double curruntPage;

  @override
  Widget build(BuildContext context) {
    final double screenHight = context.screenHeight * 0.48;
    final double screenwidth = context.screenWidth * 0.2;

    double drinkSize = screenwidth / (screenwidth - 15);
    return PageView.builder(
      controller: controller,
      itemCount: drinks.length,
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none, 
   itemBuilder: (context, index) {
        final scale = drinkSize - (curruntPage - index).abs() * 1;

      
        final translateX = (curruntPage - index).abs() * (screenwidth * 0.75);

        return Transform.translate(
          offset: Offset(-translateX, 0), 
          child: Transform.scale(
            scale: scale.clamp(0.5, 1.0),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      "assets/img/${drinks[index].image}",
                      height: screenHight,
                    ),
                    Positioned(
                      bottom: -screenHight * 0.04,
                      right: 0,
                      left: 0,
                      child: Image.asset("assets/img/shadow.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
