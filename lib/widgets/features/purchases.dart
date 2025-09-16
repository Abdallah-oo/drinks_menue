import 'package:drinks_menue/class/addprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchases extends StatefulWidget {
  const Purchases({super.key});

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  @override
  Widget build(BuildContext context) {
    final instanceorder = Provider.of<Addprovider>(context);
    return Expanded(
      child: instanceorder.orders.isEmpty
          ? Center(
              child: Text(
                "Your order list is empty.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              itemCount: instanceorder.orders.length,
              itemBuilder: (context, index) {
                final product = instanceorder.orders[index];
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      margin: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      elevation: 3,
                      child: ListTile(
                        hoverColor: Colors.white,
                        onTap: () {},
                        leading: Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                          child: Image.asset(
                            "assets/img/${product["product"].image}",
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product["product"].name,
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 43, 43, 42),
                              ),
                            ),
                            Text(
                              "${product["type"]} / ${product["size"]}",
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 87, 87, 86),
                              ),
                            ),
                          ],
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "€ ${product["product"].price}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 15,
                      child: GestureDetector(
                        onTap: () {
                          instanceorder.delete(index);
                        },
                        child: const Icon(
                          Icons.cancel,
                          color: Color.fromARGB(255, 221, 40, 40),
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
