import 'package:drinks_menue/Animation/scrollanimation/animated_page_item.dart';
import 'package:drinks_menue/class/card.dart';
import 'package:drinks_menue/widgets/features/drinkinfo.dart';
import 'package:drinks_menue/widgets/features/drinksize.dart';
import 'package:drinks_menue/widgets/features/name_price.dart';

import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final int initialIndex;
  const Details({super.key, required this.initialIndex});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late final PageController _controller;
  late double currentpage;
  int selectedsize = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 0.7,
    );
    currentpage = widget.initialIndex.toDouble();
    _controller.addListener(() {
      setState(() {
        currentpage = _controller.page ?? widget.initialIndex.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                NameandPrice(currentpage: currentpage),
                const SizedBox(height: 50),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemCount: Drink.products.length,
                    itemBuilder: (context, index) {
                      final product = Drink.products[index];
                      return CoverFlowItem(
                        controller: _controller,
                        index: index,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/img/${product.image}",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                "assets/img/shadow.png",
                                width: 220,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Drinksize(
                  getsize: (v) {
                    setState(() {
                      selectedsize = v;
                    });
                  },
                ),
                const SizedBox(height: 30),
                Drinkinfo(selectedsize: selectedsize, currentpage: currentpage),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
