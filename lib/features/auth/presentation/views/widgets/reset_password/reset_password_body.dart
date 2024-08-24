import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/widgets/app_body.dart';
import 'package:warsha/features/auth/presentation/views/widgets/reset_password/reset_password_form.dart';
import 'package:warsha/features/auth/presentation/views/widgets/reset_password/reset_password_header.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const ResetPasswordHeader(),
          20.verticalSpace,
          const ResetPasswordForm()
        ],
      ),
    );
  }
}
