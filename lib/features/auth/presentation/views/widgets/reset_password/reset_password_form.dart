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
    final cubit = BlocProvider.of<ResetPasswordCubit>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "New Password",
            controller: newPasswordController,
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
            validator: (value) {
              String? error = Validations.passwordValidator(value);
              if (error != null) {
                return error;
              }
              if (newPasswordController.text !=
                  confirmNewPasswordController.text) {
                return "Password doesn't match";
              }
              return null;
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
                cubit.resetPassword(
                  resetPasswordRequest: ResetPasswordRequest(
                    token: widget.token,
                    newPassword: newPasswordController.text,
                    confirmPassword: confirmNewPasswordController.text,
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
