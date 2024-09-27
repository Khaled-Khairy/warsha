import 'package:warsha/core/helpers/common_imports.dart';

enum TransitionType {
  slideFromBottom,
  slideFromLeft,
  slideFromRight,
  none,
}

abstract class PageTransition {
  Widget buildTransition(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child,
      {Curve curve = Curves.easeInOut});
}

class SlideFromBottomTransition implements PageTransition {
  @override
  Widget buildTransition(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child,
      {Curve curve = Curves.easeInOut}) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: curve,
        ),
      ),
      child: child,
    );
  }
}

class SlideFromLeftTransition implements PageTransition {
  @override
  Widget buildTransition(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child,
      {Curve curve = Curves.easeInOut}) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }
}

class SlideFromRightTransition implements PageTransition {
  @override
  Widget buildTransition(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child,
      {Curve curve = Curves.easeInOut}) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }
}

class RouteAnimations {
  static PageRouteBuilder buildPageRoute(
      Widget page, RouteSettings settings, TransitionType transitionType,
      {Duration duration = const Duration(milliseconds: 300),
      Curve curve = Curves.decelerate}) {
    PageTransition transition;

    switch (transitionType) {
      case TransitionType.slideFromBottom:
        transition = SlideFromBottomTransition();
        break;
      case TransitionType.slideFromLeft:
        transition = SlideFromLeftTransition();
        break;
      case TransitionType.slideFromRight:
        transition = SlideFromRightTransition();
        break;
      case TransitionType.none:
      default:
        return _buildNoTransition(settings, page);
    }

    return PageRouteBuilder(
      settings: settings,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.buildTransition(
          animation,
          secondaryAnimation,
          child,
          curve: curve,
        );
      },
    );
  }

  static PageRouteBuilder _buildNoTransition(
      RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
    );
  }
}
