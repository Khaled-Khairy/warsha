import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_status.dart';

class CourseStatusBody extends StatelessWidget {
  const CourseStatusBody({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseUnitCubit, CourseUnitState>(
      listener: (context, state) {
        if (state is CourseStatusSuccess) {
          if (state.subscriptionStatus.state == "confirmed") {
            context.pushReplacementNamed(
              Routes.courseUnitView,
              arguments: slug,
            );
          }
        }
      },
      builder: (context, courseStatusState) {
        if (courseStatusState is CourseStatusLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            ),
          );
        } else if (courseStatusState is CourseStatusSuccess) {
          return _buildSubscriptionStatus(courseStatusState, context);
        } else if (courseStatusState is CourseStatusFailure) {
          return Center(
            child: FailureStateError(
              message: courseStatusState.errMessage,
            ),
          );
        } else {
          return const FailureStateError(
            message: 'Unhandled Error',
          );
        }
      },
    );
  }

  Widget _buildSubscriptionStatus(
      CourseStatusSuccess state, BuildContext context) {
    switch (state.subscriptionStatus.state) {
      case "under_review":
        return const CourseStatus(
          lottie: "assets/lotties/under_review.json",
          state: "Under Review",
          message:
              "Thank you for your purchase! We’re reviewing your request and will notify you once the process is complete. We appreciate your patience.",
        );
      case "rejected":
        return CourseStatus(
          lottie: "assets/lotties/rejected.json",
          state: "Rejected",
          message: state.subscriptionStatus.reason,
        );
      case "confirmed":
        return const SizedBox.shrink();
      default:
        return const FailureStateError(message: "Unhandled Error");
    }
  }
}
