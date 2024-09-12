import 'package:warsha/core/helpers/common_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await checkIfLoggedUser();
  // fixed screen util text bug in release mode
  await ScreenUtil.ensureScreenSize();
  // Set system UI styles and orientations before running the app
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorsManager.mainGreen,
      statusBarColor: ColorsManager.mainGreen,
    ),
  );
  // disable landscape mode
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    Warsha(appRouter: AppRouter()),
  );
}

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
        initialRoute: isLoggedUser ? Routes.appNavBar : Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
