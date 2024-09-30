import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, required this.token});

  final String token;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "New Password",
            controller: newPasswordController,
            enableCopyPaste: false,
            validator: (value) {
              return Validations.passwordValidator(value);
            },
            isObscureText: isObscureText,
            prefixIcon: Icon(
              Iconsax.lock_outline,
              size: 24.w,
              color: ColorsManager.grey,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                size: 24.w,
                color: ColorsManager.grey,
              ),
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Confirm Password",
            controller: confirmNewPasswordController,
            enableCopyPaste: false,
            validator: (value) {
              return Validations.passwordConfirmValidator(
                value,
                newPasswordController.text.trim(),
              );
            },
            isObscureText: isObscureText,
            prefixIcon: Icon(
              Iconsax.lock_outline,
              size: 24.w,
              color: ColorsManager.grey,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                size: 24.w,
                color: ColorsManager.grey,
              ),
            ),
          ),
          20.verticalSpace,
          AppTextButton(
            onPressed: () {
              closeKeyboard(context);
              if (formKey.currentState!.validate()) {
                context.read<ResetPasswordCubit>().resetPassword(
                      resetPasswordRequest: ResetPasswordRequest(
                        token: widget.token,
                        newPassword: newPasswordController.text.trim(),
                        confirmPassword:
                            confirmNewPasswordController.text.trim(),
                      ),
                    );
              }
            },
            text: "Confirm",
          ),
        ],
      ),
    );
  }
}
