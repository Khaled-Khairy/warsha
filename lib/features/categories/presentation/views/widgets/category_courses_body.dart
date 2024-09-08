import 'package:warsha/core/helpers/common_imports.dart';

class CategoryCoursesBody extends StatefulWidget {
  const CategoryCoursesBody({super.key, required this.category});

  final String category;

  @override
  State<CategoryCoursesBody> createState() => _CategoryCoursesBodyState();
}

class _CategoryCoursesBodyState extends State<CategoryCoursesBody> {
  @override
  void initState() {
    BlocProvider.of<CategoryCoursesCubit>(context).getCategoryCourses(category: widget.category);
    super.initState();
  }

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
