import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/widgets/course_details.dart';

class CourseDetailsBody extends StatelessWidget {
  const CourseDetailsBody({
    super.key,
    required this.course,
    required this.index,
  });

  final CourseModel course;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is MyCoursesSuccess) {
          if (state.subscribedCourses.isEmpty || index >= state.subscribedCourses.length) {
            context.read<HomeCubit>().getCourseStatus(slug: course.slug);
          }
        }
      },
      builder: (context, state) {
        if (state is MyCoursesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyCoursesSuccess) {
          if (state is CourseStatusLoading) {
            return const Text("a7a");
          }else if(state is CourseStatusSuccess){
            return const Text("a7oosaa");

          }else if(state is CourseStatusFailure){
            return const Text("a7ooaaaaaaaaaaaasda");

          } else {
            return const Text("a7ooasda");
          }
        } else if (state is MyCoursesFailure) {
          return _buildErrorMessage(state.errMessage);
        } else {
          return const Center(
            child: FailureStateError(message: "Unhandled Error"),
          );
        }
      },
    );
  }

  Widget _buildCourseDetails(BuildContext context, MyCoursesSuccess state) {
    if (state.subscribedCourses.isEmpty ||
        index >= state.subscribedCourses.length) {
      return CourseDetails(
        course: course,
        courseState: 'default',
      );
    }

    final isMatchingCourse = state.subscribedCourses[index].slug == course.slug;
    if (isMatchingCourse) {
      return _checkCourseStatus(state);
    } else {
      return CourseDetails(
        course: course,
        courseState: 'default',
      );
    }
  }

  Widget _checkCourseStatus(HomeState state) {
    if (state is CourseStatusSuccess) {
      return CourseDetails(
        course: course,
        courseState: _mapCourseState(state.courseStatus.state),
      );
    } else if (state is CourseStatusLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CourseStatusFailure) {
      return _buildErrorMessage(state.errMessage);
    } else {
      return const Center(
        child: FailureStateError(message: "Unhandled Error"),
      );
    }
  }

  String _mapCourseState(String courseState) {
    switch (courseState) {
      case "under_review":
        return 'under_review';
      case "confirmed":
        return 'confirmed';
      case "rejected":
        return 'rejected';
      default:
        return 'default';
    }
  }

  Widget _buildErrorMessage(String message) {
    return Center(
      child: FailureStateError(message: message),
    );
  }
}
