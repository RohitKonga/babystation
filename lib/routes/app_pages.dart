import 'package:babystation/features/account/view/my_profile.dart';
import 'package:babystation/features/auth/view/login_page.dart';
import 'package:babystation/features/home/view/home_page.dart';
import 'package:babystation/features/onboarding/view/onboarding_screen_page.dart';
import 'package:babystation/features/splash/view/splash_screen.dart';
import 'package:babystation/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.home, page: () => MyHomePage()),
    GetPage(name: Routes.onboard, page: () => OnboardingScreenPage()),
    GetPage(name: Routes.profile, page: () => MyProfile()),
  ];
}
