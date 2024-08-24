import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(CupertinoIcons.clear),
            ),
          ],
        ),
        Lottie.asset(
          "assets/lotties/account_created.json",
          width: double.infinity,
          height: 240.h,
          backgroundLoading: true,
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
        Text(
          "Reset Password",
          style: TextStyles.font26GreenBold,
        ),
        Text(
          "Enter your new password must be at least 8 characters long with letters, numbers, and special characters.",
          style: TextStyles.font16GreyRegular,
        ),
      ],
    );
  }
}
