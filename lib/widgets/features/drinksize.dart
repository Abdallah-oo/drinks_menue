import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Drinksize extends StatefulWidget {
  final Function(int) getsize;
  const Drinksize({super.key, required this.getsize});
  

  @override
  State<Drinksize> createState() => _DrinksizeState();
}

class _DrinksizeState extends State<Drinksize> {
  List<int> picsized = [19, 21, 24];
  int selectedsize = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "size :",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(picsized.length, (index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: selectedsize == index
                        ? const Color.fromARGB(255, 82, 209, 32)
                        : Color.fromARGB(255, 219, 218, 219),
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() => selectedsize = index);
                      widget.getsize(index);
                    },

                    child: SvgPicture.asset(
                      "assets/other/vector.svg",
                      height: double.parse(picsized[index].toString()),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
