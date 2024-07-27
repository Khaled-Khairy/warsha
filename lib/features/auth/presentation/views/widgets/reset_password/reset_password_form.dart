import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ResetPasswordCubit>(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: cubit.otp,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "OTP cannot be empty";
              }
              if (value.length != 6) {
                return "Please enter a valid phone number";
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
            passwordController: cubit.passwordController,
            originalPasswordController: cubit.passwordController,
          ),
          10.verticalSpace,
          CustomPasswordField(
            label: "Confirm password",
            passwordController: cubit.confirmPasswordController,
            originalPasswordController: cubit.passwordController,
          ),
        ],
      ),
    );
  }
}
