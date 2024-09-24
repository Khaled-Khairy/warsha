import 'package:warsha/core/helpers/common_imports.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Username",
            controller: userNameController,
            validator: (value) {
              return Validations.userNameValidator(value);
            },
            prefixIcon: Icon(
              Iconsax.user_outline,
              size: 24.w,
              color: ColorsManager.grey,
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Email",
            controller: emailController,
            validator: (value) {
              return Validations.emailValidator(value);
            },
            prefixIcon: Icon(
              Clarity.email_line,
              size: 24.w,
              color: ColorsManager.grey,
            ),
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Phone Number",
            controller: phoneNumberController,
            validator: (value) {
              return Validations.phoneNumberValidator(value);
            },
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
            controller: passwordController,
            validator: (value) {
              return Validations.passwordValidator(value);
            },
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
            controller: confirmPasswordController,
            validator: (value) {
              String? error = Validations.passwordValidator(value);
              if (error != null) {
                return error;
              }
              if (passwordController.text != confirmPasswordController.text) {
                return "Password doesn't match";
              }
              return null;
            },
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
          AppTextButton(
            onPressed: () {
              closeKeyboard(context);
              if (formKey.currentState!.validate()) {
                context.read<SignUpCubit>().signUp(
                  signUpRequest: SignUpRequest(
                    email: emailController.text.trim(),
                    username: userNameController.text.trim(),
                    phone: phoneNumberController.text.trim(),
                    password: passwordController.text.trim(),
                    confirmPassword: confirmPasswordController.text.trim(),
                  ),
                );
              }
            },
            text: "Create Account",
          ),
        ],
      ),
    );
  }
}
