import 'package:drinks_menue/core/themes/colors.dart';
import 'package:drinks_menue/features/Home/Presentation/views/home_view_body.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// Entry point for the Home feature.
/// Keeps routing and scaffold concerns separate from the body.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child:  Scaffold(
          backgroundColor: AppColors.background,
          body: ChangeNotifierProvider(create: (context) {
        return CartProvider();
      },child: HomeViewBody()),
        ),
      ),
    );
  }
}
