import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/widgets/app_body.dart';
import 'package:warsha/features/auth/presentation/views/widgets/send_otp/send_otp_form.dart';
import 'package:warsha/features/auth/presentation/views/widgets/send_otp/send_otp_header.dart';

class SendOtpBody extends StatelessWidget {
  const SendOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const SendOtpHeader(),
          20.verticalSpace,
          const SendOtpForm()
        ],
      ),
    );
  }
}
