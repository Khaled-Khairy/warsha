import 'package:warsha/core/helpers/common_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(
          getIt.get<HomeRepoImpl>(),
        )..getAllCourses(),
        child: const Center(
          child: HomeBody(),
        ),
      ),
    );
  }
}
