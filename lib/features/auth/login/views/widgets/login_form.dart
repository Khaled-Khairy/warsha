import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          style: Styles.bodyNormal(context),
          decoration: InputDecoration(
              prefixIcon: Icon(
                size: 24.r,
                Clarity.email_line,
                color: Theme.of(context).iconTheme.color,
              ),
              labelText: "Email",
              labelStyle: Styles.labelStyle),
        ),
        10.verticalSpace,
        TextFormField(
          style: Styles.bodyNormal(context),
          decoration: InputDecoration(
              prefixIcon: Icon(
                size: 24.r,
                Iconsax.password_check_outline,
                color: Theme.of(context).iconTheme.color,
              ),
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Icon(
                  size: 24.r,
                  Iconsax.eye_slash_outline,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              labelText: "Password",
              labelStyle: Styles.labelStyle),
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
                ))
          ],
        ),
      ],
    ));
  }
}
