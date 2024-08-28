import 'package:warsha/core/helpers/common_imports.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    // This arguments to be passed in any screen like this
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.loginScreen:
        return RouteAnimations.buildPageRoute(
          const LoginView(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.signUpScreen:
        return RouteAnimations.buildPageRoute(
          const SignUpView(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.sendOtpScreen:
        return RouteAnimations.buildPageRoute(
          const SendOtpView(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.validateOtpScreen:
        return RouteAnimations.buildPageRoute(
          ValidateOtpView(
            resetPasswordEmail: arguments as String,
          ),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.resetPasswordScreen:
        return RouteAnimations.buildPageRoute(
          ResetPasswordView(
            token: arguments as String,
          ),
          settings,
          TransitionType.slideFromRight,
        );
      default:
        return null;
    }
  }
}
