import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/widgets/course_details_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView(
      {super.key, required this.course, required this.index});

  final CourseModel course;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..checkSubscription(),
        child: SafeArea(
          child: CourseDetailsBody(
            course: course,
          ),
        ),
      ),
    );
  }
}
