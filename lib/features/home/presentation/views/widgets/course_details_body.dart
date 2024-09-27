import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/widgets/course_details.dart';

class CourseDetailsBody extends StatelessWidget {
  const CourseDetailsBody({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is CourseStatusSuccess) {
          final String courseState = state.courseStatus.state;
          switch (courseState) {
            case "under_review":
              return CourseDetails(
                course: course,
                courseState: 'under_review',
              );
            case "confirmed":
              return CourseDetails(
                course: course,
                courseState: 'confirmed',
              );
            case "rejected":
              return CourseDetails(
                course: course,
                courseState: 'rejected',
              );
            default:
              return CourseDetails(
                course: course,
                courseState: 'default',
              );
          }
        } else if (state is CourseStatusLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CourseStatusFailure) {
          return FailureStateError(message: state.errMessage);
        } else {
          return const FailureStateError(message: "Unhandled Error");
        }
      },
    );
  }
}
