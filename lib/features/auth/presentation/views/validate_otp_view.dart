import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class ValidateOtpView extends StatelessWidget {
  const ValidateOtpView({super.key, required this.email});

  final String email;

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
                create: (context) =>
                    ValidateOtpCubit(getIt.get<AuthRepoImpl>()),
                child: ValidateOtpBody(
                  email: email,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
