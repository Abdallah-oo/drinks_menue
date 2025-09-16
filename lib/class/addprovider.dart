import 'package:drinks_menue/class/card.dart';
import 'package:flutter/widgets.dart';

class Addprovider with ChangeNotifier {
  List orders = [];

  additem(Drink p, int amount ,String type,String size) {
    for (int i = 0; i < amount; i++) {
      orders.add(
        {"product":p,"type":type,"size":size}
        );
    }

    notifyListeners();
  }

  calcpayment() {
    int total = 0;
    for (int i = 0; i < orders.length; i++) {
      total += int.parse(orders[i]["product"].price);
    }

    return total;
  }

  delete(int index) {
    orders.removeAt(index);
    notifyListeners();
  }
}
