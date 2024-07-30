import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

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
              icon: const Icon(CupertinoIcons.clear),
            ),
          ],
        ),
        Lottie.asset(
          "assets/animation/new_password.json",
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
          "Enter your new password must be at least 8 characters long with letters, numbers, and special characters.",
          style: Styles.underHeadlines(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
