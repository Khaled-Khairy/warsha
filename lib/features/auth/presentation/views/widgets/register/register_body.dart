import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is RegisterSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          if (context.mounted) {
            showCustomSnackBar(
              context,
              "Registration Success\nPlease login",
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
        } else if (state is RegisterFailed) {
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
        final cubit = BlocProvider.of<RegisterCubit>(context);
        return Column(
          children: [
            Column(
              children: [
                const RegisterHeader(),
                const RegisterForm(),
                10.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      closeKeyboard(context);
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.register(
                          registerUser: RegisterUser(
                            username: cubit.userNameController.text,
                            email: cubit.emailController.text,
                            phone: cubit.phoneNumberController.text,
                            password: cubit.passwordController.text,
                            confirmPassword:
                                cubit.confirmPasswordController.text,
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
                      "Create Account",
                      style: Styles.bodyBold,
                    ),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ],
        );
      },
    );
  }
}
