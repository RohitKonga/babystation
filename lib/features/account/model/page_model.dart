class PageModel {
  final int id;
  final String title;
  final String description;

  PageModel({required this.id, required this.title, required this.description});

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
