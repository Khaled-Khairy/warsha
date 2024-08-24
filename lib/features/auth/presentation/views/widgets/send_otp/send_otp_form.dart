import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/utils/resources/colors.dart';
import 'package:warsha/core/utils/routing/routes.dart';
import 'package:warsha/core/widgets/app_text_form_field.dart';
import 'package:warsha/core/widgets/get_started_button.dart';

class SendOtpForm extends StatefulWidget {
  const SendOtpForm({super.key});

  @override
  State<SendOtpForm> createState() => _SendOtpFormState();
}

class _SendOtpFormState extends State<SendOtpForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            prefixIcon: Icon(
              Clarity.email_line,
              size: 24.r,
              color: ColorsManager.grey,
            ),
          ),
          20.verticalSpace,
          AppTextButton(onPressed: () {
            context.pushReplacementNamed(Routes.validateOtpScreen);
          }, text: "Continue"),
        ],
      ),
    );
  }
}
