import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildExpansionItem(
                        context,
                        "How to order?",
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      ),
                      _buildExpansionItem(
                        context,
                        "How to track order?",
                        "You can track your order in the My Orders section.  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo",
                      ),
                      _buildExpansionItem(
                        context,
                        "How to cancel order?",
                        "Orders can be cancelled within 30 minutes of placement.  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
                      ),
                      _buildExpansionItem(
                        context,
                        "Can I re-order again?",
                        "Orders can be cancelled within 30 minutes of placement.  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
                      ),
                      _buildExpansionItem(
                        context,
                        "How to pay for an order?",
                        "Orders can be cancelled within 30 minutes of placement.  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
                      ),
                      _buildExpansionItem(
                        context,
                        "How to change lanaguge?",
                        "Orders can be cancelled within 30 minutes of placement.  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
                      ),
                      _buildExpansionItem(
                        context,
                        "Can I login through Social account?",
                        "Orders can be cancelled within 30 minutes of placement.  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
                      ),
                      _buildExpansionItem(
                        context,
                        "How to logout my account?`",
                        "Orders can be cancelled within 30 minutes of placement.  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionItem(
    BuildContext context,
    String question,
    String answer,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        children: [
          Text(
            answer,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
