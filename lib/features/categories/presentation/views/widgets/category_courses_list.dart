import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/courses_list.dart';

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
