import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_status.dart';

import 'course_unit_bloc_builder.dart';

class CourseStatusBody extends StatelessWidget {
  const CourseStatusBody({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseUnitCubit, CourseUnitState>(
      builder: (context, state) {
        if (state is CourseStatusLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            ),
          );
        } else if (state is CourseStatusSuccessSuccess) {
          if (state.subscriptionStatus.state == "under_review") {
            return const CourseStatus(
              lottie: "assets/lotties/under_review.json",
              state: "Under Review",
              message: "Thank you for your purchase! We’re reviewing your request and will notify you once the process is complete. \nWe appreciate your patience.",
            );
          } else if (state.subscriptionStatus.state == "rejected") {
            return CourseStatus(
              lottie: "assets/lotties/rejected.json",
              state: "Rejected",
              message: state.subscriptionStatus.reason,
            );
          } else if (state.subscriptionStatus.state == "confirmed") {
            return CourseUnitBlocBuilder(
              slug: slug,
            );
          } else {
            return const FailureStateError(
              message: "Unhandled Error",
            );
          }
        } else if (state is CourseStatusFailure) {
          return Center(
            child: FailureStateError(
              message: state.errMessage,
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
