import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/categories/presentation/views/widgets/category_courses_body.dart';

class CategoryCoursesView extends StatelessWidget {
  const CategoryCoursesView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoryCoursesCubit(getIt.get<CategoriesRepoImpl>())..getCategoryCourses(category: category),
        child: CategoryCoursesBody(
          category: category,
        ),
      ),
    );
  }
}
