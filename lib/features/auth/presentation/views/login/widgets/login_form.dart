import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<LoginCubit>(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cubit.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
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
              PasswordTextField(
                label: "Password",
                passwordController: cubit.passwordController,
                originalPasswordController: cubit.passwordController,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.r,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                      visualDensity: VisualDensity.compact,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                  ),
                  Text(
                    "Remember me",
                    style: Styles.bodyNormal(context),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
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
        );
      },
    );
  }
}
