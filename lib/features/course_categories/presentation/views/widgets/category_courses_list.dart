import 'package:warsha/core/helpers/common_imports.dart';

class CategoryCoursesList extends StatelessWidget {
  const CategoryCoursesList({
    super.key,
    required this.courses,
  });

  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: ListView.builder(
        itemCount: courses.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.courseDetailsScreen,
                  arguments: courses[index],
                );
              },
              child: CourseContentCard(
                course: courses[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
