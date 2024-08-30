import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/course_details/presentation/views/widgets/course_details_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CourseDetailsBody(),
    );
  }
}
