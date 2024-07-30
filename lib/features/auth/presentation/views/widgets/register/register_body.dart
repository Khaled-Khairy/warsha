import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/views/widgets/register/register_form.dart';

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
        }
        else if (state is RegisterSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          if (context.mounted) {
            showCustomSnackBar(
              context,
              "Registration Success\nPlease login",
              AppColors.successColor,
              Icons.check_circle_outline,
              3,
            );
          }
          Future.delayed(
            const Duration(seconds: 4),
            () {
              GoRouter.of(context).pop();
            },
          );
        }
        else if (state is RegisterFailed) {
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
            Column(
              children: [
                const RegisterHeader(),
                const RegisterForm(),
                10.verticalSpace,
              ],
            ),
          ],
        );
      },
    );
  }
}
