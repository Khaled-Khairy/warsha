import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/watch_course/presentation/views/widgets/watch_course_body.dart';

class WatchCourseView extends StatelessWidget {
  const WatchCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => CourseUnitsCubit(getIt.get<CourseUnitRepoImpl>())..getCourseUnits(),
        child: const SafeArea(
          child: WatchCourseBody(),
        ),
      ),
    );
  }
}
