import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/watch_course/presentation/views/widgets/course_content_lessons.dart';

class CourseContentTile extends StatelessWidget {
  const CourseContentTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "1. Introduction",
        style: TextStyles.font20GreenBold,
      ),
      subtitle: Text(
        "a7aa",
        style: TextStyles.font16GreyRegular,
      ),
      leading: Container(
        width: 2,
        color: ColorsManager.mainGreen,
      ),
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      childrenPadding: EdgeInsets.symmetric(horizontal: 12.w),
      expandedAlignment: Alignment.centerLeft,
      tilePadding: EdgeInsets.symmetric(horizontal: 0),
      children: const [
        CourseContentLessons(),
      ],
    );
  }
}
