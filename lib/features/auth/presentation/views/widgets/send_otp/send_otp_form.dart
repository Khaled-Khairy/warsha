import 'package:warsha/core/helpers/common_imports.dart';

class SendOtpForm extends StatefulWidget {
  const SendOtpForm({super.key});

  @override
  State<SendOtpForm> createState() => _SendOtpFormState();
}

class _SendOtpFormState extends State<SendOtpForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: (value) {},
            prefixIcon: Icon(
              Clarity.email_line,
              size: 24.w,
              color: ColorsManager.grey,
            ),
          ),
          20.verticalSpace,
          AppTextButton(
              onPressed: () {
                context.pushReplacementNamed(Routes.validateOtpScreen);
              },
              text: "Continue"),
        ],
      ),
    );
  }
}
