import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/presentation/views/widgets/custom_auth_button.dart';

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
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              CustomEmailField(emailController: emailController),
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
                      GoRouter.of(context).push(AppRouter.kSendOtp);
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
        CustomAuthButton(
          label: "Login",
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
        ),
      ],
    );
  }
}
