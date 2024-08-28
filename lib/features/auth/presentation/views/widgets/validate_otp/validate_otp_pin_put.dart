import 'package:warsha/core/helpers/common_imports.dart';

class ValidateOtpPinPut extends StatelessWidget {
  const ValidateOtpPinPut({
    super.key,
    required this.otpController,
  });

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyles.font20offWhiteSemiBold,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.grey,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: ColorsManager.mainGreen,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(16.r),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: ColorsManager.errorColor,
      ),
      borderRadius: BorderRadius.circular(12.r),
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
