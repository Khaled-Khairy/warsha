import 'package:warsha2/core/utils/common_imports.dart';

abstract class AppRouter {
  static const kHomeView = "/loginView";
  static const kSignUpView = "/signupView";
  static const kSendOtp = "/sendOtp";
  static const kValidateOtp = "/validateOtp";
  static const kResetPassword = "/resetPassword";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) =>
            Transitions.noTransition(child: const LoginView()),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) =>
            Transitions.noTransition(child: const HomeView()),
      ),
      GoRoute(
        path: kSignUpView,
        pageBuilder: (context, state) =>
            Transitions.noTransition(child: const RegisterView()),
      ),
      GoRoute(
        path: kSendOtp,
        pageBuilder: (context, state) =>
            Transitions.noTransition(child: const SendOtpView()),
      ),
      GoRoute(
        path: kValidateOtp,
        pageBuilder: (context, state) {
          final email = state.extra as String;
          return Transitions.noTransition(child: ValidateOtpView(email: email));
        },
      ),
      GoRoute(
        path: kResetPassword,
        pageBuilder: (context, state) {
          final token = state.extra as String;
          return Transitions.noTransition(
              child: ResetPasswordView(token: token));
        },
      ),
    ],
    redirect: (context, state) {
      final CacheNetwork cacheNetwork = GetIt.instance<CacheNetwork>();
      final token = cacheNetwork.getData(key: "access");
      if (token.isNotEmpty) {
        return AppRouter.kHomeView;
      } else {
        return null;
      }
    },
  );
}
