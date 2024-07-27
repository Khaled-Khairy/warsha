import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: BlocProvider(
                create: (context) => ResetPasswordCubit(getIt.get<AuthRepoImpl>()),
                child: const ResetPasswordBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
