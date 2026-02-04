import 'package:babystation/features/category/view/category_detail_screen.dart';
import 'package:babystation/features/home/view/product_detail_screen.dart';
import 'package:babystation/features/splash/view/splash_screen.dart';
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
        '/product-detail': (context) => const ProductDetailScreen(), 
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
