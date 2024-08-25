import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/utils/resources/colors.dart';
import 'package:warsha/core/utils/resources/styles.dart';
import 'package:warsha/core/routing/routes.dart';
import 'package:warsha/core/widgets/app_text_form_field.dart';
import 'package:warsha/core/widgets/get_started_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            prefixIcon: Icon(
              Clarity.email_line,
              size: 24.r,
              color: ColorsManager.grey,
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Password",
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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(Routes.sendOtpScreen);
              },
              child: Text(
                "Forget Password?",
                style: TextStyles.font14GreyRegular,
              ),
            ),
          ),
          20.verticalSpace,
          AppTextButton(onPressed: () {}, text: "Login"),
        ],
      ),
    );
  }
}
