import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/subscribed_courses/presentation/views/widgets/subscribed_course_detail_header.dart';
import 'package:warsha/features/subscribed_courses/presentation/views/widgets/subscribed_course_details_information.dart';

class SubscribedCourseDetailBody extends StatelessWidget {
  const SubscribedCourseDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubscribedCourseDetailHeader(),
          SubscribedCourseDetailsInformation(),
        ],
      ),
    );
  }
}
