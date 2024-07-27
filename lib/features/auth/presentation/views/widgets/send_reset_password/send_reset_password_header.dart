import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class SendResetPasswordHeader extends StatelessWidget {
  const SendResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Lottie.asset("assets/animation/forget.json", height: 250.h),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forget Password",
              style: Styles.headLines,
            ),
            Text(
              "Don’t worry some time people can forget too, enter your email and we will sent you a password reset code",
              style: Styles.underHeadlines(context),
            ),
          ],
        ),
      ],
    );
  }
}
