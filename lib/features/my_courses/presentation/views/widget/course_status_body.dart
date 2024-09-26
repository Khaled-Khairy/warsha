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
            context.pushReplacementNamed(Routes.courseUnitView,
                arguments: slug);
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
          if (courseStatusState.subscriptionStatus.state == "under_review") {
            return const CourseStatus(
              lottie: "assets/lotties/under_review.json",
              state: "Under Review",
              message:
                  "Thank you for your purchase! We’re reviewing your request and will notify you once the process is complete. \nWe appreciate your patience.",
            );
          } else if (courseStatusState.subscriptionStatus.state == "rejected") {
            return CourseStatus(
              lottie: "assets/lotties/rejected.json",
              state: "Rejected",
              message: courseStatusState.subscriptionStatus.reason,
            );
          } else if (courseStatusState.subscriptionStatus.state == "confirmed") {
            return const CircularProgressIndicator();
          } else {
            return const FailureStateError(
              message: "Unhandled Error",
            );
          }
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
}
