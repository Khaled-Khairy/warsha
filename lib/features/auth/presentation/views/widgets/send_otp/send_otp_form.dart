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

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SendOtpCubit>(context);
    return Form(
      key: formKey,
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
                cubit.sendOtp(
                  sendOtpRequest: SendOtpRequest(
                    email: widget.emailController.text,
                  ),
                );
              }
            },
            text: "Continue",
          ),
        ],
      ),
    );
  }
}
