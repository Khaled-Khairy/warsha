import 'package:warsha/core/helpers/common_imports.dart';

import 'course_unit_bloc_builder.dart';

class CourseUnitBody extends StatelessWidget {
  const CourseUnitBody({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseUnitCubit, CourseUnitState>(
      builder: (context, state) {
        if (state is SubscriptionStateLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            ),
          );
        } else if (state is SubscriptionStateSuccess) {
          if (state.subscriptionStatus.state == "under_review") {
            return const Text("under_review");
          } else if (state.subscriptionStatus.state == "rejected") {
            return const Text("rejected");
          } else if (state.subscriptionStatus.state == "confirmed") {
            return CourseUnitBlocBuilder(
              slug: slug,
            );
          } else {
            return const FailureStateError(
              message: "Unhandled Error",
            );
          }
        } else if (state is SubscriptionStateFailure) {
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
