import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/animate_list.dart';
import 'package:warsha/features/my_courses/presentation/manager/course_unit_cubit/course_unit_cubit.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/expandable_unit.dart';

class CourseUnitBlocBuilder extends StatelessWidget {
  const CourseUnitBlocBuilder({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseUnitCubit, CourseUnitState>(
      builder: (context, courseUnitState) {
        if (courseUnitState is CourseUnitLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            ),
          );
        } else if (courseUnitState is CourseUnitSuccess) {
          return SafeArea(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: courseUnitState.courseUnit.length,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              itemBuilder: (context, index) {
                if (courseUnitState.courseUnit[index].active) {
                  return AnimateWidget(
                    index: index,
                    child: ExpandableUnit(
                      unit: courseUnitState.courseUnit[index],
                      order: courseUnitState.courseUnit[index].order,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          );
        } else if (courseUnitState is CourseUnitFailure) {
          return Center(
            child: FailureStateError(
              message: courseUnitState.errMessage,
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
