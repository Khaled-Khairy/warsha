import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/send_otp_cubit/send_otp_cubit.dart';

class SendOtpForm extends StatefulWidget {
  const SendOtpForm({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  State<SendOtpForm> createState() => _SendOtpFormState();
}

class _SendOtpFormState extends State<SendOtpForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            controller: widget.emailController,
            validator: (value) {
              return Validations.emailValidator(value);
            },
            prefixIcon: Icon(
              Clarity.email_line,
              size: 24.w,
              color: ColorsManager.grey,
            ),
          ),
          20.verticalSpace,
          AppTextButton(
            onPressed: () {
              closeKeyboard(context);
              if (formKey.currentState!.validate()) {
                context.read<SendOtpCubit>().sendOtp(
                      sendOtpRequest: SendOtpRequest(
                        email: widget.emailController.text.trim(),
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
