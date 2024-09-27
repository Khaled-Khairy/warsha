import 'package:warsha/core/helpers/common_imports.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(getIt.get<HomeRepoImpl>(),)..getAllCourses(),
        child: const Center(
          child: HomeBody(),
        ),
      ),
    );
  }
}
