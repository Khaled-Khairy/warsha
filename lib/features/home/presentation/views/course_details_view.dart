import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/widgets/course_details_body.dart';
import 'package:warsha/features/my_courses/data/repos/my_courses_repo/my_courses_repo_impl.dart';
import 'package:warsha/features/my_courses/presentation/manager/my_courses_cubit/my_courses_cubit.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final course = ModalRoute.of(context)!.settings.arguments as CourseModel;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MyCoursesCubit(getIt.get<MyCoursesRepoImpl>())
              ..getSubscribedCourses(),
          ),
        ],
        child: CourseDetailsBody(
          course: course,
        ),
      ),
    );
  }
}
