class LatestArticle {
  final String id;
  final String image;
  final String category;
  final String title;
  final String content;
  final String date;

  LatestArticle({
    required this.id,
    required this.image,
    required this.category,
    required this.title,
    required this.content,
    required this.date,
  });

  factory LatestArticle.fromJson(Map<String, dynamic> json) {
    return LatestArticle(
      id: json['id'],
      image: json['image'] ?? "",
      category: json['category'] ?? "",
      title: json['title'] ?? "",
      content: json['content'] ?? "",
      date: json['date'] ?? "",
    );
  }
}
