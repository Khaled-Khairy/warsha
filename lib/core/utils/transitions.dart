import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Transitions {
  static CustomTransitionPage<T> noTransition<T>({required Widget child}) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: Duration.zero, // No transition
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child; // No transition effect
      },
    );
  }

  static CustomTransitionPage<T> slideFromBottomTransition<T>(
      {required Widget child}) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage<T> slideFromRightTransition<T>(
      {required Widget child}) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
