import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/courses_list.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';
import 'package:warsha/core/widgets/nothing_found.dart';
import 'package:warsha/features/my_courses/presentation/manager/my_courses_cubit/my_courses_cubit.dart';

class MyCoursesBody extends StatelessWidget {
  const MyCoursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesCubit, MyCoursesState>(
      builder: (context, state) {
        if (state is MyCoursesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            ),
          );
        } else if (state is MyCoursesSuccess) {
          return SafeArea(
            child: state.courses.isNotEmpty
                ? CoursesList(
                    courses: state.courses,
                    onTap: (index) {
                      context.pushNamed(
                        Routes.courseUnitView,
                        arguments: state.courses[index].slug,
                      );
                    },
                  )
                : const NothingFound(
                    title: 'No Courses Purchased Yet',
                    subTitle: "It looks like you haven't purchased any courses yet. Browse our courses to find and buy courses that interest you!",
                  ),
          );
        } else if (state is MyCoursesFailure) {
          return Center(
              child: FailureStateError(
            message: state.errMessage,
          ));
        } else {
          return const FailureStateError(
            message: 'Unhandled error',
          );
        }
      },
    );
  }
}

