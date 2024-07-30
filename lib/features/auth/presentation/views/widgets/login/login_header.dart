import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Lottie.asset("assets/animation/login.json",
            height: 280.h,
            width: double.infinity,
            backgroundLoading: true,
            alignment: Alignment.center),
        Text(
          "Welcome Back",
          style: Styles.headLines,
        ),
        Text(
          "Just Enjoy",
          style: Styles.underHeadlines(context),
        ),
      ],
    );
  }
}
