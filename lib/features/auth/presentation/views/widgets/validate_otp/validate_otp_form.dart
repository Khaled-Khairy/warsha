import 'package:warsha/core/helpers/common_imports.dart';

class ValidateOtpForm extends StatefulWidget {
  const ValidateOtpForm({super.key, required this.resetPasswordEmail});

  final String resetPasswordEmail;

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
              debugPrint(
                  "===============================================\nEmail : ${widget.resetPasswordEmail}");
            },
            text: "Continue",
          ),
        ],
      ),
    );
  }
}
