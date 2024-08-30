import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/subscribed_courses/presentation/views/widgets/subscribed_courses_header.dart';
import 'package:warsha/features/subscribed_courses/presentation/views/widgets/subscribed_courses_list.dart';

class SubscribedCoursesBody extends StatelessWidget {
  const SubscribedCoursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const SubscribedCoursesHeader(),
          10.verticalSpace,
          const SubscribedCoursesList(),
        ],
      ),
    );
  }
}
