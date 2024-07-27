import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is LoginFailed) {
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
          children: [
            const LoginHeader(),
            20.verticalSpace,
            const LoginForm(),
            10.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: OutlinedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignUpView);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius
                        .circular(12)
                        .r,
                  ),
                  side: BorderSide(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                ),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSurface,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
