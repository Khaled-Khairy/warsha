import 'package:warsha2/core/utils/common_imports.dart';

abstract class AppRouter {
  static const kHomeView = "/loginView";
  static const kSignUpView = "/signupView";
  static final router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const LoginView()),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(
        path: kSignUpView, builder: (context, state) => const RegisterView()),
  ]);
}
