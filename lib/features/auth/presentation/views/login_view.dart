import 'package:flutter/material.dart';
import 'package:warsha/features/auth/presentation/views/widgets/login/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
