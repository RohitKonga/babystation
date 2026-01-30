import 'package:babystation/features/ui/category%20module/category_detail_screen.dart';
import 'package:babystation/features/ui/home%20page%20module/product_detail_screen.dart';
import 'package:babystation/features/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/category-detail': (context) => const CategoryDetailScreen(),
        '/product-detail': (context) => const ProductDetailScreen(), // Add this
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(162, 34, 142, 100),
        ),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
