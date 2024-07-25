import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/views/signup/widgets/signup_form.dart';
import 'package:warsha2/features/auth/presentation/views/signup/widgets/signup_header.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<SignUpCubit>(context);
        return Column(
          children: [
            Column(
              children: [
                const SignupHeader(),
                const SignupForm(),
                10.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      closeKeyboard(context);
                      cubit.formKey.currentState!.validate();
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
