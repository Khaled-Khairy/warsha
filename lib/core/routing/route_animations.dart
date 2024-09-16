import 'package:warsha/core/helpers/common_imports.dart';

enum TransitionType {
  slideFromBottom,
  slideFromLeft,
  slideFromRight,
  sharedAxisHorizontal,
  fadeThrough,
  fadeScale,
  none,
}

class RouteAnimations {
  static PageRouteBuilder buildPageRoute(Widget page, RouteSettings settings, TransitionType transitionType, {Duration duration = const Duration(milliseconds: 300)}) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case TransitionType.slideFromBottom:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.slideFromLeft:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.slideFromRight:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.sharedAxisHorizontal:
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          case TransitionType.fadeThrough:
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          case TransitionType.fadeScale:
            return FadeScaleTransition(
              animation: animation,
              child: child,
            );
          case TransitionType.none:
          default:
            return child; // No transition
        }
      },
    );
  }
}
