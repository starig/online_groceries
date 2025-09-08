import 'package:flutter/material.dart';
import 'package:online_groceries/config/theme/theme.dart';
import 'package:online_groceries/navigation/router.dart';

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Groceries Online', theme: lightTheme, routerConfig: router);
  }
}
