import 'package:babystation/features/account/controller/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    final FaqController controller = Get.find<FaqController>();
    final headerColor = const Color(0xFF9C278F);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQs",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: headerColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (controller.faqList.isEmpty) {
                      return Center(child: Text("No FAQs found"));
                    }
                    return ListView.builder(
                      itemCount: controller.faqList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final category = controller.faqList[index];
                        return ExpansionTile(
                          title: Text(
                            category.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: category.items.map((faq) {
                            return ExpansionTile(
                              title: Text(
                                faq.question,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    faq.answer,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade600,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildExpansionItem(
  //   BuildContext context,
  //   String question,
  //   String answer,
  // ) {
  //   return Theme(
  //     data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
  //     child: ExpansionTile(
  //       title: Text(
  //         question,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           color: Colors.black,
  //           fontSize: 18,
  //         ),
  //       ),
  //       iconColor: Colors.black,
  //       collapsedIconColor: Colors.black,
  //       childrenPadding: const EdgeInsets.symmetric(
  //         horizontal: 16,
  //         vertical: 10,
  //       ),

  //       children: [
  //         Text(
  //           answer,
  //           style: TextStyle(
  //             color: Colors.grey.shade600,
  //             fontSize: 16,
  //             height: 1.5,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
