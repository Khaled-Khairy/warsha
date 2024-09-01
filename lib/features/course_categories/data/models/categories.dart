class Categories {
  final String name;

  Categories({
    required this.name,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      name: json['name'],
    );
  }
}
