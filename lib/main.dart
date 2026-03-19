import 'package:drinks_menue/features/Home/Presentation/views/home_view.dart';
import 'package:drinks_menue/features/ItemDetails/Presentation/provider/addprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // It's good practice to ensure the binding is initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeView(),
      ),
    );
  }
}
