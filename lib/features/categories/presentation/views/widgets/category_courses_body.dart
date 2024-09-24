import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/failure_state_error.dart';
import 'package:warsha/core/widgets/nothing_found.dart';

class CategoryCoursesBody extends StatelessWidget {
  const CategoryCoursesBody({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCoursesCubit, CategoryCoursesState>(
      builder: (context, state) {
        if (state is CategoryCoursesLoading) {
          return const CircularProgressIndicator(
            color: ColorsManager.mainGreen,
          );
        } else if (state is CategoryCoursesSuccess) {
          return state.courses.isNotEmpty
              ? CategoryCoursesList(courses: state.courses)
              : const NothingFound(
                  title: "No Courses Available",
                  subTitle: "No courses found in this category at the moment.",
                );
        } else if (state is CategoryCoursesFailure) {
          return FailureStateError(
            message: state.errMessage,
          );
        } else {
          return const FailureStateError(
            message: '',
          );
        }
      },
    );
  }
}
