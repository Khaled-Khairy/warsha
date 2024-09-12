import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:warsha/core/helpers/common_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await checkIfLoggedUser();
  await ScreenUtil.ensureScreenSize();
  runApp(
    Warsha(appRouter: AppRouter()),
  );
  WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) async {
      if (Platform.isAndroid) {
        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
      }
    },
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorsManager.mainGreen,
      statusBarColor: ColorsManager.mainGreen,
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
        initialRoute: isLoggedUser ? Routes.appNavBar : Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
