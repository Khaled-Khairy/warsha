class CourseModel {
  final String slug;
  final String title;
  final String description;
  final List<Category> categories;
  final String image;
  final String author;
  final int numOfLessons;
  final int duration;
  final String cost;

  CourseModel({
    required this.slug,
    required this.title,
    required this.description,
    required this.categories,
    required this.image,
    required this.author,
    required this.numOfLessons,
    required this.duration,
    required this.cost,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      slug: json['slug'],
      title: json['title'],
      description: json['description'],
      categories: (json['categories'] as List<dynamic>)
          .map((category) => Category.fromJson(category as Map<String, dynamic>))
          .toList(),
      image: json['image'],
      author: json['author'],
      numOfLessons: json['num_of_lessons'],
      duration: json['duration'],
      cost: json['cost'],
    );
  }

}
class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
    );
  }

}
