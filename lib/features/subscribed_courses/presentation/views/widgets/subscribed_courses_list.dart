import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/course_content_card.dart';

class SubscribedCoursesList extends StatelessWidget {
  const SubscribedCoursesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(Routes.subscribedCoursesDetailsScreen);
            },
            child: const CourseContentCard(),
          ),
        );
      },
    );
  }
}
