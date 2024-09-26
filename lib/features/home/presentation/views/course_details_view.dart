import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/widgets/course_details_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CourseDetailsBody(
          course: course,
        ),
      ),
    );
  }
}
