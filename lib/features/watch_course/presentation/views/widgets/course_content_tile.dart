import 'package:warsha/core/helpers/common_imports.dart';

class CourseContentTile extends StatelessWidget {
  const CourseContentTile({
    super.key,
    required this.unit, required this.onLessonTap,
  });

  final CourseUnit unit;
  final Function(String) onLessonTap;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "${unit.order}. ${unit.title}",
        style: TextStyles.font20GreenBold,
      ),
      subtitle: Text(
        unit.description,
        style: TextStyles.font16GreyRegular,
      ),
      leading: Container(
        width: 2,
        height: double.infinity,
        color: ColorsManager.mainGreen,
      ),
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      childrenPadding: EdgeInsets.symmetric(horizontal: 12.w),
      expandedAlignment: Alignment.centerLeft,
      tilePadding: EdgeInsets.zero,
      children: unit.lessons.asMap().entries.map((entry) {
        Lesson lesson = entry.value;
        return CourseContentLessons(
          lesson: lesson, onLessonTap: onLessonTap,
        );
      }).toList(),
    );
  }
}
