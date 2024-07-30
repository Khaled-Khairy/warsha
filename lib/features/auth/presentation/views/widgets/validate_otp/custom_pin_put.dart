import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(20),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.errorColor),
      borderRadius: BorderRadius.circular(16),
    );
    return Pinput(
      controller: otpController,
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      validator: (value) {
        if (value!.length < 6) {
          return "Please enter a valid OTP";
        } else if (value.isEmpty) {
          return "OTP cannot be empty!";
        } else {
          return null;
        }
      },
    );
  }
}
