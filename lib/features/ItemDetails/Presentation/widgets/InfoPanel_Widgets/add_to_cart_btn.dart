import 'package:drinks_menue/features/Home/Data/item_model.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/size_and_qty_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartBtn extends StatefulWidget {
  const AddToCartBtn({
    super.key,

    required List<ItemModel> items,
    required this.curruntIndex, 
  }) : _items = items;

  final List<ItemModel> _items;

  final int curruntIndex;



  @override
  State<AddToCartBtn> createState() => _AddToCartBtnState();
}

class _AddToCartBtnState extends State<AddToCartBtn> {
  static const List<String> _sizeLabels = ['small', 'medium', 'large'];
  bool _isButtonPressed = false;

  void _addToCart() {
    final provider=context.read<SizeAndQtyProvider>();
    final quantity = provider.getQuantity(widget.curruntIndex);
    final sizeIndex = provider.getSizeIndex(widget.curruntIndex);

    if (_isButtonPressed) return;
    final cart = Provider.of<CartProvider>(context, listen: false);
    final item = widget._items[widget.curruntIndex];
    cart.addItem(
      product: item,
      quantity: quantity,
      type: item.isHot ? 'hot' : 'iced',
      size: _sizeLabels[sizeIndex],
    );
    setState(() => _isButtonPressed = true);
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) setState(() => _isButtonPressed = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _addToCart,

      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(_isButtonPressed ? 0.96 : 1.0),
        transformAlignment: Alignment.center,
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          textAlign: TextAlign.center,
          "Add To Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
