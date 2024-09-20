import 'package:flutter/cupertino.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class ChangePasswordHeader extends StatelessWidget {
  const ChangePasswordHeader({super.key});

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
          "assets/lotties/forget.json",
          width: double.infinity,
          height: 240.h,
          backgroundLoading: true,
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
        10.verticalSpace,
        Text(
          "Change Your Password",
          style: TextStyles.font26GreenBold,
        ),
        Text(
          "Enter your current password, choose a new password, and confirm it.",
          style: TextStyles.font16GreyRegular,
        ),
      ],
    );
  }
}
