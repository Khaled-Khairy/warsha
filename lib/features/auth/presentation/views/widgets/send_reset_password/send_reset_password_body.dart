import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class SendResetPasswordBody extends StatefulWidget {
  const SendResetPasswordBody({super.key});

  @override
  State<SendResetPasswordBody> createState() => _SendResetPasswordBodyState();
}

class _SendResetPasswordBodyState extends State<SendResetPasswordBody> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                GoRouter.of(context).pushReplacement(AppRouter.kResetPassword,
                    extra: emailController.text);
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
                  key: formKey,
                  child: CustomEmailField(emailController: emailController)),
            ),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  closeKeyboard(context);
                  if (formKey.currentState!.validate()) {
                    cubit.sendResetPassword(
                      sendResetPasswordData: SendResetPasswordData(
                        email: emailController.text,
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
            10.verticalSpace,
          ],
        );
      },
    );
  }
}
