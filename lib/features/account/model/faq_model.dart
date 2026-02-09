import 'dart:convert';

class FaqCategory {
  final String title;
  final List<FaqItem> items;

  FaqCategory({required this.title, required this.items});

  factory FaqCategory.fromJson(Map<String, dynamic> json) {
    List rawFaq = [];
    if (json['faq'] is String) {
      rawFaq = jsonDecode(json['faq']);
    } else {
      rawFaq = json['faq'] ?? [];
    }
    return FaqCategory(
      title: json['title'] ?? '',
      items: rawFaq.map((e) => FaqItem.fromJson(e)).toList(),
    );
  }
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(question: json['question'], answer: json['answer']);
  }
}
