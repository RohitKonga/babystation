import 'package:babystation/features/account/controller/address_controller.dart';
import 'package:babystation/features/account/controller/faq_controller.dart';
import 'package:babystation/features/account/controller/pages_controller.dart';
import 'package:babystation/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AddressController>(AddressController(), permanent: true);
    Get.put(PagesController(), permanent: true);
    Get.put(FaqController(), permanent: true);
  }
}
