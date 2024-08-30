import 'package:warsha/core/helpers/common_imports.dart';

class CourseDetailsBody extends StatelessWidget {
  const CourseDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseDetailsHeader(),
          CourseDetailsInformation(),
        ],
      ),
    );
  }
}


