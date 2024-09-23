import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/courses_list.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';
import 'package:warsha/features/my_courses/presentation/manager/my_courses_cubit/my_courses_cubit.dart';

class MyCoursesBody extends StatelessWidget {
  const MyCoursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesCubit, MyCoursesState>(
      builder: (context, state) {
        if (state is MyCoursesLoading) {
          return const CircularProgressIndicator(
            color: ColorsManager.mainGreen,
          );
        } else if (state is MyCoursesSuccess) {
          return SafeArea(
            child: state.courses.isNotEmpty
                ? CoursesList(
                    courses: state.courses,
                    onTap: (index) {
                      context.pushNamed(
                        Routes.courseUnitView,
                        arguments: state.courses[index].slug,
                      );
                    },
                  )
                : Center(
                    child: AppBody(
                      child: Column(
                        children: [
                          Lottie.asset(
                            "assets/lotties/empty.json",
                            height: 240.h,
                            backgroundLoading: true,
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          ),
                          10.verticalSpace,
                          Text(
                            "No Courses Purchased Yet",
                            style: TextStyles.font26GreenBold,
                          ),
                          Text(
                            "It looks like you haven't purchased any courses yet. Browse our courses to find and buy courses that interest you!",
                            style: TextStyles.font16GreyRegular,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        } else if (state is MyCoursesFailure) {
          return  FailureStateError(message: state.errMessage,);
        } else {
          return  const FailureStateError(message: 'Unhandled error',);
        }
      },
    );
  }
}
