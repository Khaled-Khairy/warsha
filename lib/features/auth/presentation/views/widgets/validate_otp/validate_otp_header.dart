import 'package:flutter/cupertino.dart';
import 'package:warsha/core/helpers/common_imports.dart';

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
              icon: Icon(
                CupertinoIcons.clear,
                size: 24.w,
              ),
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
