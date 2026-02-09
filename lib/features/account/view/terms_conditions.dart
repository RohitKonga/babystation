import 'package:babystation/features/account/controller/pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PagesController controller = Get.find<PagesController>();
    final headerColor = const Color(0xFF9C278F);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
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
          return Center(child: CircularProgressIndicator());
        }
        final description = controller.getTermsConditions();

        if (description.isEmpty) {
          return Center(child: Text("No Terms & Condition found"));
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
