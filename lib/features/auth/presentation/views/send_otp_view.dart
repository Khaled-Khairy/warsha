import 'package:flutter/material.dart';
import 'package:warsha/features/auth/presentation/views/widgets/send_otp/send_otp_body.dart';

class SendOtpView extends StatelessWidget {
  const SendOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SendOtpBody(),
    );
  }
}
