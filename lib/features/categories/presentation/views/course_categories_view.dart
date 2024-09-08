import 'package:warsha/core/helpers/common_imports.dart';

class CourseCategoriesView extends StatelessWidget {
  const CourseCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoriesCubit(getIt.get<CategoriesRepoImpl>()),
        child: const CourseCategoriesBody(),
      ),
    );
  }
}
