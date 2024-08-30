import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/subscribed_courses/presentation/views/subscribed_course_details_view.dart';

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
          return RouteAnimations.buildPageRoute(
            const ValidateOtpView(),
            settings,
            TransitionType.slideFromRight,
          );
        }
        return null;
      case Routes.resetPasswordScreen:
        if (arguments is String) {
          return RouteAnimations.buildPageRoute(
            const ResetPasswordView(),
            settings,
            TransitionType.slideFromRight,
          );
        }
        return null;
      case Routes.appNavBar:
        return RouteAnimations.buildPageRoute(
          const AppNavBar(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.courseDetailsScreen:
        return RouteAnimations.buildPageRoute(
          const CourseDetailsView(),
          settings,
          TransitionType.fadeThrough,
        );
      case Routes.subscribedCoursesScreen:
        return RouteAnimations.buildPageRoute(
          const SubscribedCoursesView(),
          settings,
          TransitionType.fadeThrough,
        );
      case Routes.subscribedCoursesDetailsScreen:
        return RouteAnimations.buildPageRoute(
          const SubscribedCourseDetailsView(),
          settings,
          TransitionType.fadeThrough,
        );
      default:
        return null;
    }
  }
}
