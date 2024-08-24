import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Lottie.asset(
            "assets/lotties/signup.json",
            height: 220.h,
            backgroundLoading: true,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "Let’s create your account",
          style: TextStyles.font26GreenBold,
        ),
      ],
    );
  }
}
