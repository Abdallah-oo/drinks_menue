import 'package:cafe_app/core/themes/colors.dart';
import 'package:cafe_app/features/Home/Presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class CafeApp extends StatelessWidget {
  const CafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafe App',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: AppColors.background)),
      home: HomeView(),
    );
  }
}
