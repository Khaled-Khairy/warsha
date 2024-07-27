import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<LoginCubit>(context);
        return Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email cannot be empty";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                          .hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    style: Styles.bodyNormal(context),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        size: 24.r,
                        Clarity.email_line,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      labelText: "Email",
                      labelStyle: Styles.labelStyle(context),
                    ),
                  ),
                  10.verticalSpace,
                  LoginPassword(
                    passwordController: passwordController,
                  ),
                  Row(
                    children: [
                      // const CustomCheckBox(),
                      // Text(
                      //   "Remember me",
                      //   style: Styles.bodyNormal(context),
                      // ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .push(AppRouter.kSendResetPassword);
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.blue.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  closeKeyboard(context);
                  if (formKey.currentState!.validate()) {
                    cubit.login(
                      loginUser: LoginUser(
                        email: emailController.text,
                        password: passwordController.text,
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
                  "Login",
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
