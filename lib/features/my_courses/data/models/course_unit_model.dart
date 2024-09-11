class CourseUnit {
  final String title;
  final String description;
  final int order;
  final bool active;
  final List<Lesson> lessons;

  CourseUnit({
    required this.title,
    required this.description,
    required this.order,
    required this.active,
    required this.lessons,
  });

  factory CourseUnit.fromJson(Map<String, dynamic> json) {
    return CourseUnit(
      title: json['title'],
      description: json['description'],
      order: json['order'],
      active: json['active'],
      lessons: List<Lesson>.from(json['lessons'].map((x) => Lesson.fromJson(x))),
    );
  }
}

class Lesson {
  final String title;
  final String videoUrl;
  final int order;
  final bool active;

  Lesson({
    required this.title,
    required this.videoUrl,
    required this.order,
    required this.active,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title'],
      videoUrl: json['video_url'],
      order: json['order'],
      active: json['active'],
    );
  }
}
