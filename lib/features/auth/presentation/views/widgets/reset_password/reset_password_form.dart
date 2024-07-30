import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/views/widgets/custom_auth_button.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, required this.token});

  final String token;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ResetPasswordCubit>(context);
        return Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomPasswordField(
                    label: "New password",
                    passwordController: passwordController,
                    originalPasswordController: passwordController,
                  ),
                  10.verticalSpace,
                  CustomPasswordField(
                    label: "Confirm password",
                    passwordController: confirmPasswordController,
                    originalPasswordController: passwordController,
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            CustomAuthButton(
              label: "Confirm",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  cubit.resetPassword(
                    resetPasswordData: ResetPasswordRequest(
                        token: widget.token,
                        newPassword: passwordController.text,
                        confirmPassword: confirmPasswordController.text),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
