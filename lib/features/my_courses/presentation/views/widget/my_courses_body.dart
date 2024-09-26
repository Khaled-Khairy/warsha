import 'package:warsha/core/helpers/common_imports.dart';

class MyCoursesBody extends StatelessWidget {
  const MyCoursesBody({
    super.key,
  });

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
