import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/features/Cart/Presentation/Views/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: AppColors.background,body: CartViewBody());
  }
}