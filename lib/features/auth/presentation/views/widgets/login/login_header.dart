import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Lottie.asset(
            "assets/lotties/welcome_back.json",
            height: 240.h,
            backgroundLoading: true,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "Welcome Back",
          style: TextStyles.font26GreenBold,
        ),
        8.verticalSpace,
        Text(
          "We’re excited to have you back, can’t wait to see what you've been up to since you last logged in.",
          style: TextStyles.font16GreyRegular,
        ),
      ],
    );
  }
}
