import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:babystation/features/account/controller/pages_controller.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PagesController controller = Get.find<PagesController>();

    final headerColor = const Color(0xFF9C278F);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: headerColor,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final description = controller.getPrivacyPolicy();
        if (description.isEmpty) {
          return const Center(child: Text("No Privacy Policy Found"));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Html(data: description),
          ),
        );
      }),
    );
  }
}
