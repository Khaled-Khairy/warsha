import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_unit_body.dart';

class CourseStatusView extends StatelessWidget {
  const CourseStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: BlocProvider(
        create: (context) => CourseUnitCubit(getIt.get<CourseUnitRepoImpl>())..getSubscriptionStatus(slug: slug),
        child: Center(
            child: CourseStatusBody(
          slug: slug,
        )),
      ),
    );
  }
}
