import 'package:flutter/material.dart';
import 'package:warsha/features/auth/presentation/views/widgets/validate_otp/validate_otp_body.dart';

class ValidateOtpView extends StatelessWidget {
  const ValidateOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ValidateOtpBody(),
    );
  }
}
