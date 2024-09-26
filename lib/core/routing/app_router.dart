import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/routing/route_animations.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
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
        if (arguments is String) {
          final resetPasswordEmail = arguments;
          return RouteAnimations.buildPageRoute(
            ValidateOtpView(
              resetPasswordEmail: resetPasswordEmail,
            ),
            settings,
            TransitionType.slideFromRight,
          );
        }
      case Routes.resetPasswordScreen:
        if (arguments is String) {
          final token = arguments;
          return RouteAnimations.buildPageRoute(
            ResetPasswordView(
              token: token,
            ),
            settings,
            TransitionType.slideFromRight,
          );
        }
      case Routes.appNavBar:
        return RouteAnimations.buildPageRoute(
          const AppNavBar(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.courseDetailsScreen:
        if (arguments is CourseModel) {
          final course = arguments;
          return RouteAnimations.buildPageRoute(
            CourseDetailsView(
              course: course,
            ),
            settings,
            TransitionType.slideFromRight,
          );
        }
      case Routes.categoryCoursesView:
        if (arguments is String) {
          final category = arguments;
          return RouteAnimations.buildPageRoute(
            CategoryCoursesView(
              category: category,
            ),
            settings,
            TransitionType.slideFromRight,
          );
        }
      case Routes.buyNowView:
        if (arguments is String) {
          final slug = arguments;
          return RouteAnimations.buildPageRoute(
            BuyNowView(
              slug: slug,
            ),
            settings,
            TransitionType.slideFromRight,
          );
        }
      case Routes.courseUnitView:
        if (arguments is Map<String, dynamic>) {
          final slug = arguments['slug'] as String;
          final telegramUrl = arguments['telegramUrl'] as String;
          return RouteAnimations.buildPageRoute(
            CourseUnitView(
              slug: slug,
              telegramUrl: telegramUrl,
            ),
            settings,
            TransitionType.slideFromBottom,
          );
        }
      case Routes.videoPlayerView:
        if (arguments is String) {
          final videoUrl = arguments;
          return RouteAnimations.buildPageRoute(
            VideoPlayerView(
              videoUrl: videoUrl,
            ),
            settings,
            TransitionType.none,
          );
        }
      case Routes.changePasswordView:
        return RouteAnimations.buildPageRoute(
          const ChangePasswordView(),
          settings,
          TransitionType.slideFromRight,
        );
      default:
        return null;
    }
    return null;
  }
}
