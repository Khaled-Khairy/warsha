import 'package:warsha2/core/utils/common_imports.dart';

abstract class AppRouter {
  static const kHomeView = "/loginView";
  static const kSignUpView = "/signupView";
  static const kSendResetPassword = "/sendResetPassword";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const LoginView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
          path: kSignUpView, builder: (context, state) => const RegisterView()),
      GoRoute(
          path: kSendResetPassword,
          builder: (context, state) => const SendResetPasswordView()),
    ],
    redirect: (context, state) {
      final CacheNetwork cacheNetwork = GetIt.instance<CacheNetwork>();
      final token = cacheNetwork.getData(key: "token");
      if (token.isNotEmpty) {
        return AppRouter.kHomeView;
      } else {
        return null;
      }
    },
  );
}
