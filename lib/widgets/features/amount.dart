import 'package:flutter/material.dart';

class Amount extends StatefulWidget {
  final Function(int) onAmountChanged;
  const Amount({super.key, required this.onAmountChanged});

  @override
  State<Amount> createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 111, 112, 112),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        
        children: [
          GestureDetector(
            onTap: () {
              amount > 1
                  ? setState(() {
                      amount--;
                    })
                  : setState(() {
                      amount = 1;
                    });
              widget.onAmountChanged(amount);
            },
            child: Icon(Icons.remove, color: Colors.white),
          ),

          SizedBox(width: 10),
          Text(
            "$amount",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                amount++;
              });
              widget.onAmountChanged(amount);
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
