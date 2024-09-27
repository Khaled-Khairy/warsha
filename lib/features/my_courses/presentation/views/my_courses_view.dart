import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/data/repos/my_courses_repo/my_courses_repo_impl.dart';
import 'package:warsha/features/my_courses/presentation/manager/my_courses_cubit/my_courses_cubit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/my_courses_body.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MyCoursesCubit(getIt.get<MyCoursesRepoImpl>())..getSubscribedCourses(),
        child: const MyCoursesBody(),
      ),
    );
  }
}
