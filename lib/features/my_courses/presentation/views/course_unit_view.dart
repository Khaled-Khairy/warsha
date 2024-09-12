import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_unit_body.dart';

class CourseUnitView extends StatelessWidget {
  const CourseUnitView({super.key});

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CourseUnitCubit(getIt.get<CourseUnitRepoImpl>()),
          ),
        ],
        child: CourseUnitBody(
          slug: slug,
        ),
      ),
    );
  }
}
