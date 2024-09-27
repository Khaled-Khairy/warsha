import 'package:warsha/core/helpers/common_imports.dart';

class CategoryCoursesList extends StatelessWidget {
  const CategoryCoursesList({
    super.key,
    required this.courses,
    required this.category,
  });

  final List<CourseModel> courses;
  final String category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CoursesList(
        courses: courses,
        onRefresh: () async {
          context
              .read<CategoryCoursesCubit>()
              .getCategoryCourses(category: category);
        },
      ),
    );
  }
}
