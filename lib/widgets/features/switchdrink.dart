import 'package:flutter/material.dart';

class Toggleswitch extends StatefulWidget {
  const Toggleswitch({super.key, required this.setsize});
  final Function(bool) setsize;
  @override
  State<Toggleswitch> createState() => _ToggleswitchState();
}

class _ToggleswitchState extends State<Toggleswitch> {
  bool isiced = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color.fromARGB(255, 111, 112, 112),
      ),
      child: Row(
      
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isiced = !isiced;
              });
              widget.setsize(isiced);
            },
            child: AnimatedContainer(
              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: isiced
                    ? const Color.fromARGB(255, 111, 112, 112)
                    : const Color.fromARGB(255, 34, 33, 33),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text("Hot", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              setState(() {
                isiced = !isiced;
              });
              widget.setsize(isiced);
            },
            child: AnimatedContainer(
              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: isiced
                    ? const Color.fromARGB(255, 34, 33, 33)
                    : const Color.fromARGB(255, 111, 112, 112),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text("Iced", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
