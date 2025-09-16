import 'package:drinks_menue/class/addprovider.dart';
import 'package:drinks_menue/widgets/features/purchases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    final instanceorder = Provider.of<Addprovider>(context);
    final pay = instanceorder.calcpayment();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "My Order",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        actions: [
          Text(
            "€$pay",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Purchases(),
          if (instanceorder.orders.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 15,
                  ),
                ),
                child: Text(
                  "Pay : € $pay",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
