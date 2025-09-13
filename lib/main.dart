// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trend_cart/providers/cart_provider.dart';
import 'package:trend_cart/screens/splash_screen.dart';
import 'package:trend_cart/utils/theme.dart';

void main() {
  runApp(const TrendCartApp());
}

class TrendCartApp extends StatelessWidget {
  const TrendCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide the CartProvider to the entire widget tree.
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'TrendCart',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, // Automatically switches theme
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
