import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/watch_course/presentation/views/widgets/course_player.dart';

class WatchCourseBody extends StatelessWidget {
  const WatchCourseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseUnitsCubit, CourseUnitsState>(
      builder: (context, state) {
        if (state is CourseUnitsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            ),
          );
        } else if (state is CourseUnitsSuccess) {
          return const CoursePlayer();
        } else if (state is CourseUnitsFailure) {
          return Center(
            child: Text(
              "Failed",
              style: TextStyles.font16offWhiteSemiBold,
            ),
          );
        } else {
          return Text(
            "Unhandled Error",
            style: TextStyles.font16offWhiteSemiBold,
          );
        }
      },
    );
  }
}
