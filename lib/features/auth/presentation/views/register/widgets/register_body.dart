import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
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
