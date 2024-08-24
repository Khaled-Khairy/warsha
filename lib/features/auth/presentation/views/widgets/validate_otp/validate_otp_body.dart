import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/widgets/app_body.dart';
import 'package:warsha/features/auth/presentation/views/widgets/validate_otp/validate_otp_form.dart';
import 'package:warsha/features/auth/presentation/views/widgets/validate_otp/validate_otp_header.dart';

class ValidateOtpBody extends StatelessWidget {
  const ValidateOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBody(
      child: Column(
        children: [
          const ValidateOtpHeader(),
          20.verticalSpace,
          const ValidateOtpForm()
        ],
      ),
    );
  }
}
