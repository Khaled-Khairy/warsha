import 'package:warsha/core/helpers/common_imports.dart';

class CourseContentLessons extends StatelessWidget {
  const CourseContentLessons({
    super.key,
    required this.lesson, required this.onLessonTap,
  });

  final Lesson lesson;
  final Function(String) onLessonTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onLessonTap(lesson.videoUrl);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.darkerGrey,
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: ListTile(
            title: Text(
              "${lesson.order}. ${lesson.title}",
              style: TextStyles.font16offWhiteMedium,
            ),
          ),
        ),
      ),
    );
  }
}
