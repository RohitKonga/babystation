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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(162, 34, 142, 100),
        ),
        useMaterial3: false,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
