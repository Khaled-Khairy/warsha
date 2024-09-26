import 'package:warsha/core/helpers/common_imports.dart';

class CategoryCoursesList extends StatelessWidget {
  const CategoryCoursesList({
    super.key,
    required this.courses,
  });

  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CoursesList(courses: courses),
    );
  }
}
