import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    super.key, required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
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
    );
  }
}
