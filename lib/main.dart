import 'package:warsha/core/helpers/common_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup services, configurations, and UI
  await _initializeApp();

  runApp(Warsha(appRouter: AppRouter()));
}

Future<void> _initializeApp() async {
  await setupServiceLocator();
  await checkIfLoggedUser();
  // fixed screen util text bug in release mode
  await ScreenUtil.ensureScreenSize();
  _setSystemUIStyles();
  _lockPortraitMode();
}

void _setSystemUIStyles() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorsManager.mainGreen,
      statusBarColor: ColorsManager.mainGreen,
    ),
  );
}

void _lockPortraitMode() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}
