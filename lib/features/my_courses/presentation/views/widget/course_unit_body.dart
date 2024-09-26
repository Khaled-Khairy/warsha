import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/animate_list.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/expandable_unit.dart';

class CourseUnitBody extends StatelessWidget {
  const CourseUnitBody({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseUnitCubit, CourseUnitState>(
      builder: (context, state) {
        if (state is CourseUnitLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainGreen,
            ),
          );
        } else if (state is CourseUnitSuccess) {
          return SafeArea(
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
          );
        } else if (state is CourseUnitFailure) {
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
