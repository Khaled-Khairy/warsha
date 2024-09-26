import 'package:warsha/core/helpers/common_imports.dart';

class CourseDetailsBody extends StatelessWidget {
  const CourseDetailsBody({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return CourseDetailsInformation(
      course: course,
    );
  }
}
