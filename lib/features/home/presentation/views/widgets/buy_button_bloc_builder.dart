import 'package:warsha/core/helpers/common_imports.dart';

class BuyButtonBlocBuilder extends StatelessWidget {
  const BuyButtonBlocBuilder({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is MyCoursesSuccess) {
          // If the course is already subscribed, check its status.
          if (state.subscribedCourses.isNotEmpty &&
              state.subscribedCourses[0].slug == course.slug) {
            context.read<HomeCubit>().checkStatus(slug: course.slug);
          }
        }
      },
      builder: (context, state) {
        // Handle different states and return the appropriate widget.
        if (state is MyCoursesLoading || state is CourseStatusLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyCoursesFailure) {
          return FailureStateError(message: state.errMessage);
        } else if (state is CourseStatusFailure) {
          return FailureStateError(message: state.errMessage);
        } else if (state is CourseStatusSuccess) {
          // Return the button based on course state
          return _buildCourseActionButton(context, state.courseStatus.state);
        } else if (state is MyCoursesSuccess) {
          // Default "Buy Course" button
          return _buildBuyButton(context);
        }
        return const SizedBox.shrink(); // Fallback for unhandled states
      },
    );
  }

  // Reusable method to build course action button based on the status
  Widget _buildCourseActionButton(BuildContext context, String courseState) {
    switch (courseState) {
      case "under_review":
      case "rejected":
        return AppTextButton(
          onPressed: () {
            _navigateToBuyNow(context, courseState);
          },
          text: "Update Receipt",
        );
      case "confirmed":
        return AppTextButton(
          onPressed: () {},
          text: "Go to MyCourse",
        );
      default:
        return _buildBuyButton(context);
    }
  }

  // Reusable method for the "Buy Course" button
  Widget _buildBuyButton(BuildContext context) {
    return AppTextButton(
      onPressed: () {
        _navigateToBuyNow(context, "");
      },
      text: "Buy Course",
    );
  }

  // Reusable navigation logic
  void _navigateToBuyNow(BuildContext context, String courseState) {
    context.pushNamed(
      Routes.buyNowView,
      arguments: {
        "slug": course.slug,
        "course_state": courseState,
      },
    );
  }
}
