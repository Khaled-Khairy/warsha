import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/data/models/change_password/change_password_request.dart';
import 'package:warsha/features/menu/presentation/manager/change_password_cubit/change_password_cubit.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Current Password",
            controller: currentPasswordController,
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
            controller: repeatPasswordController,
            validator: (value) {
              String? error = Validations.passwordValidator(value);
              if (error != null) {
                return error;
              }
              if (newPasswordController.text != repeatPasswordController.text) {
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
                context.read<ChangePasswordCubit>().changePassword(
                      changePasswordRequest: ChangePasswordRequest(
                        currentPassword: currentPasswordController.text.trim(),
                        newPassword: newPasswordController.text.trim(),
                        repeatPassword: repeatPasswordController.text.trim(),
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
