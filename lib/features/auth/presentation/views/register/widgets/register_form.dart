import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterCubit>(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cubit.userNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username cannot be empty";
                  }
                  if (value.length < 3) {
                    return "Username must be at least 3 characters long";
                  }
                  if (value.length > 30) {
                    return "Username cannot be more than 20 characters long";
                  }
                  final RegExp validCharacters = RegExp(r'^[a-zA-Z0-9_ ]+$');
                  if (!validCharacters.hasMatch(value)) {
                    return "Please enter a valid username";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    size: 24.r,
                    Iconsax.user_outline,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  labelText: "Username",
                  labelStyle: Styles.labelStyle(context),
                ),
              ),
              10.verticalSpace,
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
              TextFormField(
                controller: cubit.phoneNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone Number cannot be empty";
                  }
                  if (value.length != 11) {
                    return "Please enter a valid phone number";
                  }
                  final RegExp validCharacters = RegExp(r'^\d+$');
                  if (!validCharacters.hasMatch(value)) {
                    return "Phone Number must contain only digits";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Bootstrap.telephone,
                    color: Theme.of(context).iconTheme.color,
                    size: 24.r,
                  ),
                  labelText: "Phone Number",
                  labelStyle: Styles.labelStyle(context),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              10.verticalSpace,
              RegisterPassword(
                label: "Password",
                passwordController: cubit.passwordController,
                originalPasswordController: cubit.passwordController,
              ),
              10.verticalSpace,
              RegisterPassword(
                label: "Confirm Password",
                passwordController: cubit.confirmPasswordController,
                originalPasswordController: cubit.passwordController,
              ),
            ],
          ),
        );
      },
    );
  }
}
