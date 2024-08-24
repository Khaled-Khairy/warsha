import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:warsha/core/utils/resources/colors.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class ValidateOtpPinPut extends StatelessWidget {
  const ValidateOtpPinPut({
    super.key,
  });

  // final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyles.font20offWhiteSemiBold,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: ColorsManager.mainGreen,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(16).r,
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: ColorsManager.errorColor,
      ),
      borderRadius: BorderRadius.circular(12).r,
    );
    return Pinput(
      // controller: otpController,
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      // validator: (value) {
      //   if (value!.length < 6) {
      //     return "Please enter a valid OTP";
      //   } else if (value.isEmpty) {
      //     return "OTP cannot be empty!";
      //   } else {
      //     return null;
      //   }
      // },
    );
  }
}
