class CategoryDetails {
  final int id;
  final String title;
  final String description;
  final int price;

  CategoryDetails(
      {required this.id,
      required this.title,
      required this.description,
      required this.price});

  factory CategoryDetails.fromJson(Map<String, dynamic> json) {
    return CategoryDetails(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
    );
  }
}