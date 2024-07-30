import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class ValidateOtpBody extends StatelessWidget {
  const ValidateOtpBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
      listener: (context, state) {
        if (state is ValidateOtpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is ValidateOtpSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          GoRouter.of(context).pushReplacement(
            AppRouter.kResetPassword,
            extra: state.validateOtpResponse.token,
          );
        } else if (state is ValidateOtpFailed) {
          Navigator.of(context, rootNavigator: true).pop();
          showCustomSnackBar(
            context,
            state.errorMessage,
            AppColors.errorColor,
            Iconsax.info_circle_outline,
            3,
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const ValidateOtpHeader(),
            10.verticalSpace,
            ValidateOtpForm(email: email),
          ],
        );
      },
    );
  }
}
