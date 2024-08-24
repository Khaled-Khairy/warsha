import 'package:flutter/material.dart';
import 'package:warsha/features/auth/presentation/views/widgets/reset_password/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResetPasswordBody(),
    );
  }
}
