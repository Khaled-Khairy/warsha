import 'package:flutter/cupertino.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class SendOtpHeader extends StatelessWidget {
  const SendOtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              CupertinoIcons.arrow_left,
              size: 24.w,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Lottie.asset(
            "assets/lotties/forget.json",
            height: 240.h,
            backgroundLoading: true,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forget Password",
              style: TextStyles.font26GreenBold,
            ),
            Text(
              "Don’t worry some time people can forget too, enter your email and we will sent you a password reset code",
              style: TextStyles.font16GreyRegular,
            ),
          ],
        ),
      ],
    );
  }
}
