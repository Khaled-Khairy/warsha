import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';

class ValidateOtpForm extends StatefulWidget {
  const ValidateOtpForm({super.key, required this.resetPasswordEmail});

  final String resetPasswordEmail;

  @override
  State<ValidateOtpForm> createState() => _ValidateOtpFormState();
}

class _ValidateOtpFormState extends State<ValidateOtpForm> {
  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          ValidateOtpPinPut(
            otpController: otpController,
          ),
          20.verticalSpace,
          AppTextButton(
            onPressed: () {
              closeKeyboard(context);
              if (formKey.currentState!.validate()) {
                context.read<ValidateOtpCubit>().validateOtp(
                      validateOtpRequest: ValidateOtpRequest(
                        email: widget.resetPasswordEmail.trim(),
                        otp: otpController.text.trim(),
                      ),
                    );
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;

                });
              }
            },
            text: "Continue",
          ),
        ],
      ),
    );
  }
}
