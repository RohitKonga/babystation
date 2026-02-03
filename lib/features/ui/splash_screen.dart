import 'dart:async';
import 'package:babystation/features/ui/onboarding_screen_module/onboarding_screen_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreenPage()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Image.asset('assets/images/bg.png'),
        ),
        Center(
          child: Image.asset('assets/images/logo.png', height: 160, width: 220),
        ),
      ],
    );
  }
}
