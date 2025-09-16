import 'package:drinks_menue/class/addprovider.dart';
import 'package:drinks_menue/screens/cafu.dart';
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
        return Addprovider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Cafue(),
      ),
    );
  }
}
