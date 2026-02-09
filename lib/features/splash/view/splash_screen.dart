import 'dart:async';
import 'package:babystation/features/auth/controller/auth_controller.dart';
import 'package:babystation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final AuthController controller = Get.find<AuthController>();
  final storage = GetStorage();
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() {
    Timer(const Duration(seconds: 2), () {
      bool isFirstTime = storage.read('isFirstTime') ?? true;
      if (isFirstTime) {
        Get.offAllNamed(Routes.onboard);
      } else {
        if (controller.isLoggedIn) {
          Get.offAllNamed(Routes.home);
        } else {
          Get.offAllNamed(Routes.login);
        }
      }
    });
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
