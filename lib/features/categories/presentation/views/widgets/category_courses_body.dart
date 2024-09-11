import 'package:warsha/core/helpers/common_imports.dart';

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
          return CategoryCoursesList(courses: state.courses);
        } else if (state is CategoryCoursesFailure) {
          return Center(
            child: Text(
              "Failed",
              style: TextStyles.font16offWhiteSemiBold,
            ),
          );
        } else {
          return Text(
            "Unhandled Error",
            style: TextStyles.font16offWhiteSemiBold,
          );
        }
      },
    );
  }
}
