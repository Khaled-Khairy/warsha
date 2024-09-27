import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/manager/course_unit_cubit/course_unit_cubit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_unit_body.dart';


class CourseUnitView extends StatelessWidget {
  const CourseUnitView({super.key, required this.slug, required this.telegramUrl});
  final String slug, telegramUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CourseUnitCubit(getIt.get<CourseUnitRepoImpl>())..getCourseStatus(slug: slug),
        child: Center(
          child: CourseStatusBody(
            slug: slug, telegramUrl: telegramUrl,
          ),
        ),
      ),
    );
  }
}
