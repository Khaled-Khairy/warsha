import 'package:warsha/core/helpers/common_imports.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Username",
            prefixIcon: Icon(
              Iconsax.user_outline,
              size: 24.w,
              color: ColorsManager.grey,
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Email",
            prefixIcon: Icon(
              Clarity.email_line,
              size: 24.w,
              color: ColorsManager.grey,
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Phone Number",
            prefixIcon: Icon(
              Bootstrap.telephone,
              size: 24.w,
              color: ColorsManager.grey,
            ),
            textInputType: TextInputType.phone,
            textInputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Password",
            isObscureText: isObscureText,
            prefixIcon: Icon(
              Iconsax.lock_outline,
              size: 24.w,
              color: ColorsManager.grey,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                size: 24.w,
                color: ColorsManager.grey,
              ),
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Confirm Password",
            isObscureText: isObscureText,
            prefixIcon: Icon(
              Iconsax.lock_outline,
              size: 24.w,
              color: ColorsManager.grey,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                size: 24.w,
                color: ColorsManager.grey,
              ),
            ),
          ),
          20.verticalSpace,
          AppTextButton(onPressed: () {}, text: "Create Account"),
        ],
      ),
    );
  }
}
