import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/animate_list.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_status.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/expandable_unit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/telegram_button.dart';

class CourseStatusBody extends StatelessWidget {
  const CourseStatusBody(
      {super.key, required this.slug, required this.telegramUrl});

  final String slug, telegramUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseUnitCubit, CourseUnitState>(
      builder: (context, state) {
        return _handleState(state, context);
      },
    );
  }

  Widget _handleState(CourseUnitState state, BuildContext context) {
    if (state is CourseStatusLoading || state is CourseUnitLoading) {
      return _loadingIndicator();
    } else if (state is CourseStatusSuccess) {
      return _buildSubscriptionStatus(state, context);
    } else if (state is CourseUnitSuccess) {
      return _buildCourseUnitList(state);
    } else if (state is CourseStatusFailure || state is CourseUnitFailure) {
      return _errorState(state);
    } else {
      return const FailureStateError(message: 'Unhandled Error');
    }
  }

  Widget _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.mainGreen,
      ),
    );
  }

  Widget _errorState(CourseUnitState state) {
    String errorMessage = state is CourseStatusFailure
        ? state.errMessage
        : state is CourseUnitFailure
            ? state.errMessage
            : 'Unhandled Error';
    return Center(
      child: FailureStateError(message: errorMessage),
    );
  }

  Widget _buildCourseUnitList(CourseUnitSuccess state) {
    return SafeArea(
      child: Column(
        children: [
          TelegramButton(telegramUrl: telegramUrl),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.courseUnit.length,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              itemBuilder: (context, index) {
                if (state.courseUnit[index].active) {
                  return AnimateList(
                    index: index,
                    child: ExpandableUnit(
                      unit: state.courseUnit[index],
                      order: state.courseUnit[index].order,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
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
        context.read<CourseUnitCubit>().getCourseUnit(slug: slug);
        return const SizedBox.shrink();
      default:
        return const FailureStateError(message: "Unhandled Error");
    }
  }
}
