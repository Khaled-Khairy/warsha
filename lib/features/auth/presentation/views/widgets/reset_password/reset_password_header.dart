import 'package:flutter/cupertino.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            CupertinoIcons.arrow_left,
            size: 24.w,
          ),
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
