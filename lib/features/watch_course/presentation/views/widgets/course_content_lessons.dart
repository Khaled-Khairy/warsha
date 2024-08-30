import 'package:warsha/core/helpers/common_imports.dart';

class CourseContentLessons extends StatelessWidget {
  const CourseContentLessons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.darkerGrey,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: ListTile(
          title: Text(
            "3. Introduction",
            style: TextStyles.font16offWhiteMedium,
          ),
        ),
      ),
    );
  }
}
