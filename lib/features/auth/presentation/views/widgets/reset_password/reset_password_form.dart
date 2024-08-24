import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:warsha/core/utils/resources/colors.dart';
import 'package:warsha/core/widgets/app_text_form_field.dart';
import 'package:warsha/core/widgets/get_started_button.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "New Password",
            isObscureText: isObscureText,
            prefixIcon: Icon(
              Iconsax.lock_outline,
              size: 24.r,
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
                size: 24.r,
                color: ColorsManager.grey,
              ),
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Confirm Password",
            isObscureText: isObscureText,
            prefixIcon: Icon(
              Iconsax.lock_outline,
              size: 24.r,
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
                size: 24.r,
                color: ColorsManager.grey,
              ),
            ),
          ),
          20.verticalSpace,
          AppTextButton(onPressed: () {}, text: "Confirm"),
        ],
      ),
    );
  }
}
