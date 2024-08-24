import 'package:flutter/material.dart';
import 'package:warsha/core/utils/routing/routes.dart';
import 'package:warsha/features/auth/presentation/views/login_view.dart';
import 'package:warsha/features/auth/presentation/views/reset_password_view.dart';
import 'package:warsha/features/auth/presentation/views/send_otp_view.dart';
import 'package:warsha/features/auth/presentation/views/sign_up_view.dart';
import 'package:warsha/features/auth/presentation/views/validate_otp_view.dart';
import 'package:warsha/features/onboarding/presentation/views/onboarding_view.dart';

import 'route_animations.dart';

class AppRouter {
  Route<dynamic> generateRouter(RouteSettings settings) {
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
          const ValidateOtpView(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.resetPasswordScreen:
        return RouteAnimations.buildPageRoute(
          const ResetPasswordView(),
          settings,
          TransitionType.slideFromRight,
        );
      default:
        return RouteAnimations.buildPageRoute(
          Scaffold(
            body: Center(
              child: Text('No router defined for this ${settings.name}'),
            ),
          ),
          settings,
          TransitionType.none,
        );
    }
  }
}
