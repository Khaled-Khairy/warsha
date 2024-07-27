import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<ResetPasswordCubit>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ResetPasswordHeader(),
                10.verticalSpace,
                const ResetPasswordForm(),
                10.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.formKey.currentState!.validate();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .circular(12)
                            .r,
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
            ),
          ],
        );
      },
    );
  }
}
