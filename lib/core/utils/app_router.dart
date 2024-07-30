import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/views/send_otp_view.dart';

abstract class AppRouter {
  static const kHomeView = "/loginView";
  static const kSignUpView = "/signupView";
  static const kSendResetPassword = "/sendResetPassword";
  static const kResetPassword = "/resetPassword";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kSendResetPassword,
        builder: (context, state) => const SendOtpView(),
      ),
      GoRoute(
        path: kResetPassword,
        builder: (context, state) {
          final email = state.extra as String;
          return ResetPasswordView(
            email: email,
          );
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
