class QuizItem {
  final String image;
  final String name;

  QuizItem({
    required this.image,
    required this.name,
  });

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    return QuizItem(
      name: json['name'],
      image: json['image'],
    );
  }
  QuizItem.fromJson2(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'];

}