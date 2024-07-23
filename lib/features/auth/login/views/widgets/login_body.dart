import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

import 'login_form.dart';
import 'login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginHeader(),
        20.verticalSpace,
        const LoginForm(),
        10.verticalSpace,
        SizedBox(
          width: double.infinity,
          height: 52.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12).r,
              ),
            ),
            child: Text(
              "Login",
              style: Styles.bodyBold,
            ),
          ),
        ),
        10.verticalSpace,
        SizedBox(
          width: double.infinity,
          height: 52.h,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12).r,
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Text(
              "Create Account",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
