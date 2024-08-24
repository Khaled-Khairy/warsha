import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/widgets/app_body.dart';
import 'package:warsha/features/auth/presentation/views/widgets/sign_up/sign_up_form.dart';
import 'package:warsha/features/auth/presentation/views/widgets/sign_up/sign_up_header.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const SignUpHeader(),
          10.verticalSpace,
          const SignUpForm(),
        ],
      ),
    );
  }
}
