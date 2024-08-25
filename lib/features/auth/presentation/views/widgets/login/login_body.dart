import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/utils/resources/styles.dart';
import 'package:warsha/core/routing/routes.dart';
import 'package:warsha/core/widgets/app_body.dart';
import 'package:warsha/features/auth/presentation/views/widgets/login/login_form.dart';
import 'package:warsha/features/auth/presentation/views/widgets/login/login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const LoginHeader(),
          30.verticalSpace,
          const LoginForm(),
          20.verticalSpace,
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.signUpScreen);
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyles.font14GreyRegular,
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyles.font16GreenMedium,
                  ),
                ],
              ),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
