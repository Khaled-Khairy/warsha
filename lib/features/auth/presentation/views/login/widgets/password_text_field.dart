import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:warsha2/core/utils/styles.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty';
        }
        return null;
      },
      obscureText: isObscure,
      style: Styles.bodyNormal(context),
      decoration: InputDecoration(
        prefixIcon: Icon(
          size: 24.r,
          Iconsax.password_check_outline,
          color: Theme.of(context).iconTheme.color,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          child: Icon(
            size: 24.r,
            isObscure ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        labelText: "Password",
        labelStyle: Styles.labelStyle,
      ),
    );
  }
}
