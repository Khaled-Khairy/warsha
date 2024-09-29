import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha/core/helpers/extensions.dart';
import 'package:warsha/core/resources/colors.dart';
import 'package:warsha/core/routing/routes.dart';
import 'package:warsha/core/widgets/courses_list.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';
import 'package:warsha/core/widgets/nothing_found.dart';
import 'package:warsha/features/my_courses/presentation/manager/my_courses_cubit/my_courses_cubit.dart';

class MyCoursesBody extends StatelessWidget {
  const MyCoursesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesCubit, MyCoursesState>(
      builder: (context, state) {
        if (state is MyCoursesLoading) {
          return const CircularProgressIndicator(
            color: ColorsManager.mainGreen,
          );
        } else if (state is MyCoursesSuccess) {
          return state.courses.isNotEmpty
              ? CoursesList(
                  onRefresh: () async {
                    context.read<MyCoursesCubit>().getSubscribedCourses();
                  },
                  courses: state.courses,
                  onTap: (index) {
                    final String slug = state.courses[index].slug;
                    final String telegramUrl =
                        state.courses[index].telegram ?? "";
                    context.pushNamed(
                      Routes.courseUnitView,
                      arguments: {'slug': slug, 'telegramUrl': telegramUrl},
                    );
                  },
                )
              : const NothingFound(
                  title: 'No Courses Purchased Yet',
                  subTitle:
                      "It looks like you haven't purchased any courses yet. Browse our courses to find and buy courses that interest you!",
                );
        } else if (state is MyCoursesFailure) {
          return FailureStateError(
                      message: state.errMessage,
                    );
        } else {
          return const FailureStateError(
            message: 'Unhandled error',
          );
        }
      },
    );
  }
}
