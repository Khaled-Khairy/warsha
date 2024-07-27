import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class SendResetPasswordBody extends StatelessWidget {
  const SendResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendResetPasswordCubit, SendResetPasswordState>(
      listener: (context, state) {
        if (state is SendResetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is SendResetPasswordSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          if (context.mounted) {
            showCustomSnackBar(
              context,
              state.sendResetPasswordResponse.msg,
              AppColors.successColor,
              Icons.check_circle_outline,
            );
            Future.delayed(
              const Duration(seconds: 4),
                  () {
                GoRouter.of(context).pushReplacement(AppRouter.kResetPassword);
              },
            );
          }
        } else if (state is SendResetPasswordFailed) {
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
        final cubit = BlocProvider.of<SendResetPasswordCubit>(context);
        return Column(
          children: [
            const SendResetPasswordHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Form(
                  key: cubit.formKey,
                  child:
                      CustomEmailField(emailController: cubit.emailController)),
            ),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  closeKeyboard(context);
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.sendResetPassword(
                      sendResetPasswordData: SendResetPasswordData(
                        email: cubit.emailController.text,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                ),
                child: Text(
                  "Continue",
                  style: Styles.bodyBold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
