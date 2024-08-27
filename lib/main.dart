import 'package:warsha/core/di/dependency_injection.dart';
import 'package:warsha/core/helpers/common_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(
    Warsha(appRouter: AppRouter()),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorsManager.mainGreen, // navigation bar color
      statusBarColor: ColorsManager.mainGreen, // status bar color
    ),
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
        initialRoute: Routes.loginScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
