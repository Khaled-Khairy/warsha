import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';


class SendOtpBody extends StatefulWidget {
  const SendOtpBody({super.key});

  @override
  State<SendOtpBody> createState() => _SendOtpBodyState();
}

class _SendOtpBodyState extends State<SendOtpBody> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is SendOtpSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          if (context.mounted) {
            showCustomSnackBar(
              context,
              state.sendOtpResponse.message,
              AppColors.successColor,
              Icons.check_circle_outline,
              3,
            );
            // Future.delayed(
            //   const Duration(seconds: 4),
            //   () {
            //     GoRouter.of(context).pushReplacement(
            //       AppRouter.kResetPassword,
            //       extra: emailController.text,
            //     );
            //   },
            // );
          }
        } else if (state is SendOtpFailed) {
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
        final cubit = BlocProvider.of<SendOtpCubit>(context);
        return Column(
          children: [
            const SendOtpHeader(),
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
                    cubit.sendOtp(
                      sendOtpData: SendOtpData(
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
