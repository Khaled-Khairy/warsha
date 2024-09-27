import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/resources/colors.dart';
import 'package:warsha/core/widgets/animate_list.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';
import 'package:warsha/features/my_courses/presentation/manager/course_unit_cubit/course_unit_cubit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_status.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/expandable_unit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/telegram_button.dart';

class CourseStatusBody extends StatelessWidget {
  const CourseStatusBody({super.key, required this.slug, required this.telegramUrl});

  final String slug, telegramUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseUnitCubit, CourseUnitState>(
      listener: (context, state) {
        if (state is CourseStatusSuccess) {
          if (state.subscriptionStatus.state == "confirmed") {
            context.read<CourseUnitCubit>().getCourseUnit(slug: slug);
          }
        }
      },
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
          AnimateWidget(
            index: 0,
            child: TelegramButton(telegramUrl: telegramUrl),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.courseUnit.length,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              itemBuilder: (context, index) {
                if (state.courseUnit[index].active) {
                  return AnimateWidget(
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
          message: "Thank you for your purchase! We’re reviewing your request and will notify you once the process is complete. We appreciate your patience.",
        );
      case "rejected":
        return CourseStatus(
          lottie: "assets/lotties/rejected.json",
          state: "Rejected",
          message: state.subscriptionStatus.reason,
        );
      default:
        return const FailureStateError(message: "Unhandled Error");
    }
  }
}
