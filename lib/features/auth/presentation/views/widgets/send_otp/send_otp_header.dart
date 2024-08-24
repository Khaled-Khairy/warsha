import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class SendOtpHeader extends StatelessWidget {
  const SendOtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 24.r,
              ),
            ),
          ],
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
