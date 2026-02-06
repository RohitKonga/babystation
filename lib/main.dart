import 'package:babystation/core/bindings/app_binding.dart';
import 'package:babystation/core/storage/storage_service.dart';
import 'package:babystation/features/category/view/category_detail_screen.dart';
import 'package:babystation/features/home/view/product_detail_screen.dart';
import 'package:babystation/features/splash/view/splash_screen.dart';
import 'package:babystation/routes/app_pages.dart';
import 'package:babystation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = StorageService.getToken();
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
      initialRoute: token == null ? Routes.splash : Routes.home,
      routes: {
        '/': (context) => const SplashScreen(),
        '/category-detail': (context) => const CategoryDetailScreen(),
        '/product-detail': (context) => const ProductDetailScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // seedColor: Color.fromRGBO(162, 34, 142, 100),
          seedColor: Color(0xFF9C278F),
        ),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
