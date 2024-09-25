import 'package:warsha/core/helpers/common_imports.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({super.key, required this.courses, this.onTap});

  final List<CourseModel> courses;
  final void Function(int index)? onTap;

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.courses.length,
      primary: false,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: GestureDetector(
            onTap: widget.onTap != null ? () => widget.onTap!(index) : () {
                  context.pushNamed(
                    Routes.courseDetailsScreen,
                    arguments: widget.courses[index],
                  );
                },
            child: CourseContentCard(
              course: widget.courses[index],
            ),
          ),
        );
      },
    );
  }
}
