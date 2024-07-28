import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is ResetPasswordSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          if (context.mounted) {
            showCustomSnackBar(
              context,
              "Password Reset Successfully\nPlease login",
              AppColors.successColor,
              Icons.check_circle_outline,
            );
          }
          Future.delayed(
            const Duration(seconds: 4),
            () {
              GoRouter.of(context).pop();
            },
          );
        } else if (state is ResetPasswordFailed) {
          Navigator.of(context, rootNavigator: true).pop();
          showCustomSnackBar(
            context,
            state.errorMessage,
            AppColors.errorColor,
            Iconsax.info_circle_outline,
          );
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ResetPasswordHeader(),
                10.verticalSpace,
                 ResetPasswordForm(email: email,),
                10.verticalSpace,
              ],
            ),
          ],
        );
      },
    );
  }
}
