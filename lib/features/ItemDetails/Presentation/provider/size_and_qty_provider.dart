import 'package:flutter/material.dart';

class SizeAndQtyProvider extends ChangeNotifier {
  final Map<int, _DrinkState> _drinkStates = {};

  _DrinkState _getState(int index) =>
      _drinkStates.putIfAbsent(index, () => _DrinkState());

  int getQuantity(int index) => _getState(index).quantity;
  int getSizeIndex(int index) => _getState(index).sizeIndex;

  void setSizeIndex({required int index, required int sizeIndex}) {
    _getState(index).sizeIndex = sizeIndex;
    notifyListeners();
  }

  void increaseQty(int index) {
    _getState(index).quantity++;
    notifyListeners();
  }

  void decreaseQty(int index) {
    final state = _getState(index);
    if (state.quantity > 1) state.quantity--;
    notifyListeners();
  }
}

class _DrinkState {
  int sizeIndex = 0;
  int quantity = 1;
}
