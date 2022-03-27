class guizItem {
  final String image;
  final String name;

  guizItem({
    required this.image,
    required this.name,
  });

  factory guizItem.fromJson(Map<String, dynamic> json) {
    return guizItem(
      name: json['name'],
      image: json['image'],
    );
  }
  guizItem.fromJson2(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'];

}