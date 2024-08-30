
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/widgets/course_content_card.dart';

class HomeCoursesList extends StatelessWidget {
  const HomeCoursesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: const CourseContentCard(),
        );
      },
    );
  }
}
