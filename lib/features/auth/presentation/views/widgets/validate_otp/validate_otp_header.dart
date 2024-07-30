import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class ValidateOtpHeader extends StatelessWidget {
  const ValidateOtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon:  Icon(CupertinoIcons.clear,size: 24.r,),
            ),
          ],
        ),
        Lottie.asset(
          "assets/animation/verification.json",
          width: double.infinity,
          height: 280.h,
          backgroundLoading: true,
          alignment: Alignment.topCenter,
        ),
        Text(
          "Reset Password",
          style: Styles.headLines,
        ),
        Text(
          "We have sent you an email with a password reset code please check your inbox.",
          style: Styles.underHeadlines(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
