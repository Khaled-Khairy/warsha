import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otp = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    otp.dispose();
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
                  TextFormField(
                    controller: otp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "OTP cannot be empty";
                      }
                      if (value.length != 6) {
                        return "Please enter a valid OTP";
                      }
                      final RegExp validCharacters = RegExp(r'^\d+$');
                      if (!validCharacters.hasMatch(value)) {
                        return "OTP must contain only digits";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.key_outline,
                        color: Theme.of(context).iconTheme.color,
                        size: 24.r,
                      ),
                      labelText: "OTP",
                      labelStyle: Styles.labelStyle(context),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                  ),
                  10.verticalSpace,
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
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.resetPassword(
                      resetPasswordData: ResetPasswordData(
                          otp: otp.text,
                          email: widget.email,
                          newPassword: passwordController.text,
                          confirmPassword: confirmPasswordController.text),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                ),
                child: Text(
                  "Continue",
                  style: Styles.bodyBold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
