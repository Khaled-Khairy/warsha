import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.label,
    required this.passwordController,
    required this.originalPasswordController,
  });

  final String label;
  final TextEditingController passwordController;
  final TextEditingController originalPasswordController;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty!';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 chars long!';
        }
        final RegExp hasUpperCase = RegExp(r'(?=.*[A-Z])');
        final RegExp hasLowerCase = RegExp(r'(?=.*[a-z])');
        final RegExp hasDigit = RegExp(r'(?=.*\d)');
        if (!hasUpperCase.hasMatch(value)) {
          return 'Password must include an uppercase letter!';
        }
        if (!hasLowerCase.hasMatch(value)) {
          return 'Password must include a lowercase letter!';
        }
        if (!hasDigit.hasMatch(value)) {
          return 'Password must include a number!';
        }
        if (widget.originalPasswordController.text !=
            widget.passwordController.text) {
          return 'Passwords do not match!';
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
        labelText: widget.label,
        labelStyle: Styles.labelStyle(context),
      ),
    );
  }
}
