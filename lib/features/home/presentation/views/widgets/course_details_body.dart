import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';
import 'package:warsha/features/my_courses/presentation/manager/my_courses_cubit/my_courses_cubit.dart';

class CourseDetailsBody extends StatelessWidget {
  const CourseDetailsBody({super.key, required this.course});

  final CourseModel course;

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
            child: CourseDetailsInformation(
              course: course,
              subscribedCourses: state.courses,
            ),
          );
        } else if (state is MyCoursesFailure) {
          return  FailureStateError(message: state.errMessage,);
        } else {
          return Center(
            child: Text(
              "Unhandled Error",
              style: TextStyles.font16offWhiteSemiBold,
            ),
          );
        }
      },
    );
  }
}
