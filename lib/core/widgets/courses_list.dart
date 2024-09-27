import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/animate_list.dart';

class CoursesList extends StatelessWidget {
  const CoursesList(
      {super.key, required this.courses, this.onTap, required this.onRefresh});

  final List<CourseModel> courses;
  final void Function(int index)? onTap;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: ColorsManager.mainGreen,
      backgroundColor: ColorsManager.mainGrey,
      child: ListView.builder(
        itemCount: courses.length,
        primary: false,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemBuilder: (context, index) {
          return AnimateWidget(
            index: index,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: GestureDetector(
                onTap: onTap != null
                    ? () => onTap!(index)
                    : () {
                        context.pushNamed(
                          Routes.courseDetailsScreen,
                          arguments: {
                            'course': courses[index],
                            'index': index,
                          },
                        );
                      },
                child: CourseContentCard(
                  course: courses[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
