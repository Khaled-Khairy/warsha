import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/views/widgets/custom_auth_button.dart';

class ValidateOtpForm extends StatefulWidget {
  const ValidateOtpForm({super.key, required this.email});

  final String email;

  @override
  State<ValidateOtpForm> createState() => _ValidateOtpFormState();
}

class _ValidateOtpFormState extends State<ValidateOtpForm> {
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ValidateOtpCubit>(context);
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              CustomPinPut(otpController: otpController),
              10.verticalSpace,
            ],
          ),
        ),
        10.verticalSpace,
        CustomAuthButton(
          label: "Continue",
          onPressed: () {
            if (formKey.currentState!.validate()) {
              cubit.validateOtp(
                validateOtpRequest: ValidateOtpRequest(
                    email: widget.email, otp: otpController.text),
              );
            }
          },
        ),
      ],
    );
  }
}
