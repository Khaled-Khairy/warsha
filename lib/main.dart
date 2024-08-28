import 'package:warsha/core/helpers/common_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedUser();
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

bool isLoggedUser = false;

checkIfLoggedUser() async {
  String? userToken =
      await SharedPrefHelper.getString(key: SharedPrefKeys.accessToken);
  if (userToken != null && userToken.isNotEmpty) {
    isLoggedUser = true;
  } else {
    isLoggedUser = false;
  }
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
        initialRoute:
            isLoggedUser ? Routes.resetPasswordScreen : Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
