import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/manager/course_player_cubit/course_player_cubit.dart';

class CoursePlayerView extends StatelessWidget {
  const CoursePlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CourseUnitCubit(getIt.get<CourseUnitRepoImpl>()),
            ),
            BlocProvider(create: (context) => CoursePlayerCubit()),
          ],
          child: CoursePlayerBody(
            slug: slug,
          )),
    );
  }
}
