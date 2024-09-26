import 'package:warsha/core/helpers/common_imports.dart';

class Warsha extends StatelessWidget {
  final AppRouter appRouter;

  const Warsha({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: isLoggedUser ? Routes.appNavBar : Routes
            .onboardingScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
