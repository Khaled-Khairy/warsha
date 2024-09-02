import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/course_categories/presentation/views/widgets/category_courses_body.dart';

class CategoryCoursesView extends StatelessWidget {
  const CategoryCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoryListCubit(getIt.get<CategoriesRepoImpl>()),
        child: CategoryCoursesBody(
          category: category,
        ),
      ),
    );
  }
}
