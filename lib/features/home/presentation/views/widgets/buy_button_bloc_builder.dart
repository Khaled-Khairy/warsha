import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/manager/update_nav_index/update_nav_index_cubit.dart';

class BuyButtonBlocBuilder extends StatelessWidget {
  const BuyButtonBlocBuilder({
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
          final isSubscribed = state.subscribedCourses
              .any((subscribedCourse) => subscribedCourse.slug == course.slug);
          if (isSubscribed) {
            context.read<HomeCubit>().checkStatus(slug: course.slug);
          }
        }
      },
      builder: (context, state) {
        if (state is MyCoursesLoading || state is CourseStatusLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is MyCoursesFailure) {
          return FailureStateError(message: state.errMessage);
        } else if (state is CourseStatusFailure) {
          return FailureStateError(message: state.errMessage);
        } else if (state is CourseStatusSuccess) {
          return _buildCourseActionButton(
              context, state.courseStatus.state, state.courseStatus.reason);
        } else if (state is MyCoursesSuccess) {
          return _buildBuyButton(context);
        }
        return const SizedBox.shrink();
      },
    );
  }

  // Reusable method to build course action button based on the status
  Widget _buildCourseActionButton(
      BuildContext context, String courseState, String reason) {
    switch (courseState) {
      case "under_review":
      case "rejected":
        return Column(
          children: [
            reason.isNotEmpty
                ? _buildStatusRow(reason)
                : const SizedBox.shrink(),
            10.verticalSpace,
            AppTextButton(
              onPressed: () => _navigateToBuyNow(context, courseState),
              text: "Update Receipt",
            ),
            20.verticalSpace,
          ],
        );
      case "confirmed":
        return Column(
          children: [
            _buildStatusRow("You have subscribed to this course"),
            10.verticalSpace,
            AppTextButton(
              onPressed: () {
                context.read<UpdateNavIndexCubit>().updateIndex(2);
                context.pushNamedAndRemoveUntil(Routes.appNavBar,
                    predicate: (route) => false);
              },
              text: "Go to My Courses",
            ),
          ],
        );
      default:
        return _buildBuyButton(context);
    }
  }

  // Reusable method for the status row with icon and reason
  Widget _buildStatusRow(String reason) {
    return Row(
      children: [
        Center(
          child: Icon(
            Icons.error_outline,
            color: ColorsManager.mainGreen,
            size: 30.w,
          ),
        ),
        4.horizontalSpace,
        Expanded(
          child: Text(
            reason,
            style: TextStyles.font14offWhiteMedium,
          ),
        ),
      ],
    );
  }

  // Reusable method for the "Buy Course" button
  Widget _buildBuyButton(BuildContext context) {
    return AppTextButton(
      onPressed: () => _navigateToBuyNow(context, ""),
      text: "Enroll Now",
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
