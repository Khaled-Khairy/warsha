import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterCubit>(context);
        return Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: userNameController,
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
                      final RegExp validCharacters =
                          RegExp(r'^[a-zA-Z0-9_ ]+$');
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
                  CustomEmailField(
                    emailController: emailController,
                  ),
                  10.verticalSpace,
                  TextFormField(
                    controller: phoneNumberController,
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
                      LengthLimitingTextInputFormatter(11),
                    ],
                  ),
                  10.verticalSpace,
                  CustomPasswordField(
                    label: "Password",
                    passwordController: passwordController,
                    originalPasswordController: passwordController,
                  ),
                  10.verticalSpace,
                  CustomPasswordField(
                    label: "Confirm Password",
                    passwordController: confirmPasswordController,
                    originalPasswordController: passwordController,
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  closeKeyboard(context);
                  if (formKey.currentState!.validate()) {
                    print("username: ${userNameController.text},Email: ${emailController.text},Phone Number:${phoneNumberController.text},Password:${passwordController.text},ConfirmPassword:${confirmPasswordController.text}");
                    cubit.register(
                      registerUser: RegisterUser(
                        username: userNameController.text,
                        email: emailController.text,
                        phone: phoneNumberController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
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
        );
      },
    );
  }
}
