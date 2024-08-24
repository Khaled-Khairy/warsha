import 'package:flutter/material.dart';
import 'package:warsha/features/onboarding/presentation/views/widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingBody(),
    );
  }
}
