import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class ValidateOtpHeader extends StatelessWidget {
  const ValidateOtpHeader({super.key});

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
              icon:  Icon(CupertinoIcons.clear,size: 24.r,),
            ),
          ],
        ),
        Lottie.asset(
          "assets/lotties/verification.json",
          width: double.infinity,
          height: 280.h,
          backgroundLoading: true,
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
        Text(
          "Reset Password",
          style: TextStyles.font26GreenBold,
        ),
        Text(
          "We have sent you an email with a password reset code please check your inbox.",
          style: TextStyles.font16GreyRegular,
        ),
      ],
    );
  }
}
