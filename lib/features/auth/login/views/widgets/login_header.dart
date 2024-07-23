import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/common_imports.dart';

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
          "Discover our app and enjoy free content!",
          style: Styles.underHeadlines(context),
        ),
      ],
    );
  }
}
