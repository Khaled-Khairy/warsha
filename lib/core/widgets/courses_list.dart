import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/animate_list.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({super.key, required this.courses, this.onTap});

  final List<CourseModel> courses;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      primary: false,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return AnimateList(
          index: index,
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: GestureDetector(
              onTap: onTap != null
                  ? () => onTap!(index)
                  : () {
                      context.pushNamed(
                        Routes.courseDetailsScreen,
                        arguments: courses[index],
                      );
                    },
              child: CourseContentCard(
                course: courses[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
