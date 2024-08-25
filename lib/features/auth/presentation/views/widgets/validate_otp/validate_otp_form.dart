import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/routing/routes.dart';
import 'package:warsha/core/widgets/get_started_button.dart';
import 'package:warsha/features/auth/presentation/views/widgets/validate_otp/validate_otp_pin_put.dart';

class ValidateOtpForm extends StatefulWidget {
  const ValidateOtpForm({super.key});

  @override
  State<ValidateOtpForm> createState() => _ValidateOtpFormState();
}

class _ValidateOtpFormState extends State<ValidateOtpForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const ValidateOtpPinPut(),
          20.verticalSpace,
          AppTextButton(
            onPressed: () {
              context.pushNamed(Routes.resetPasswordScreen);
            },
            text: "Continue",
          ),
        ],
      ),
    );
  }
}
