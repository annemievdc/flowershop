import 'package:flowershop/screens/homepage.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlowerApp());
}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,

      title: 'Botanica Obscura',
      home: const HomePage(),
    );
  }
}
