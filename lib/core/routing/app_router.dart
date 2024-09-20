import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/views/buy_now_view.dart';
import 'package:warsha/features/menu/presentation/views/change_password_view.dart';
import 'package:warsha/features/my_courses/presentation/views/course_unit_view.dart';
import 'package:warsha/features/my_courses/presentation/views/video_player_view.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
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
      case Routes.categoryCoursesView:
        return RouteAnimations.buildPageRoute(
          const CategoryCoursesView(),
          settings,
          TransitionType.fadeThrough,
        );
      case Routes.buyNowView:
        return RouteAnimations.buildPageRoute(
          const BuyNowView(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.courseUnitView:
        return RouteAnimations.buildPageRoute(
          const CourseUnitView(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.videoPlayerView:
        return RouteAnimations.buildPageRoute(
          const VideoPlayerView(),
          settings,
          TransitionType.fadeThrough,
        );
      case Routes.changePasswordView:
        return RouteAnimations.buildPageRoute(
          const ChangePasswordView(),
          settings,
          TransitionType.slideFromRight,
        );
      default:
        return null;
    }
  }
}
