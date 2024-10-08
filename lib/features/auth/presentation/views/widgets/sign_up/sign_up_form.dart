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
  final ValueNotifier<bool> isObscureTextNotifier = ValueNotifier(true);
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    isObscureTextNotifier.dispose();
    super.dispose();
  }

  Widget buildTextFormField({
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
    required IconData prefixIcon,
    TextInputType? textInputType,
    List<TextInputFormatter>? textInputFormatter,
    bool isObscureText = false,
    GestureDetector? suffixIcon,
    bool enableCopyPaste = true,
  }) {
    return AppTextFormField(
      hintText: hintText,
      enableCopyPaste: enableCopyPaste,
      controller: controller,
      validator: validator,
      prefixIcon: Icon(
        prefixIcon,
        size: 24.w,
        color: ColorsManager.grey,
      ),
      textInputType: textInputType,
      textInputFormatter: textInputFormatter,
      isObscureText: isObscureText,
      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          buildTextFormField(
            hintText: "Username",
            controller: userNameController,
            validator: (value) => Validations.userNameValidator(value),
            prefixIcon: Iconsax.user_outline,
          ),
          10.verticalSpace,
          buildTextFormField(
            hintText: "Email",
            controller: emailController,
            validator: (value) => Validations.emailValidator(value),
            prefixIcon: Clarity.email_line,
          ),
          10.verticalSpace,
          buildTextFormField(
            hintText: "Phone Number",
            controller: phoneNumberController,
            validator: (value) => Validations.phoneNumberValidator(value),
            prefixIcon: Bootstrap.telephone,
            textInputType: TextInputType.phone,
            textInputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
          ),
          10.verticalSpace,
          ValueListenableBuilder<bool>(
            valueListenable: isObscureTextNotifier,
            builder: (context, isObscure, child) {
              return buildTextFormField(
                hintText: "Password",
                controller: passwordController,
                validator: (value) => Validations.passwordValidator(value),
                enableCopyPaste: false,
                prefixIcon: Iconsax.lock_outline,
                isObscureText: isObscure,
                suffixIcon: GestureDetector(
                  onTap: () {
                    isObscureTextNotifier.value = !isObscureTextNotifier.value;
                  },
                  child: Icon(
                    isObscure ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                    size: 24.w,
                    color: ColorsManager.grey,
                  ),
                ),
              );
            },
          ),
          10.verticalSpace,
          ValueListenableBuilder<bool>(
            valueListenable: isObscureTextNotifier,
            builder: (context, isObscure, child) {
              return buildTextFormField(
                hintText: "Confirm Password",
                controller: confirmPasswordController,
                enableCopyPaste: false,
                validator: (value) {
                  return Validations.passwordConfirmValidator(
                    value,
                    passwordController.text.trim(),
                  );
                },
                prefixIcon: Iconsax.lock_outline,
                isObscureText: isObscure,
                suffixIcon: GestureDetector(
                  onTap: () {
                    isObscureTextNotifier.value = !isObscureTextNotifier.value;
                  },
                  child: Icon(
                    isObscure ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                    size: 24.w,
                    color: ColorsManager.grey,
                  ),
                ),
              );
            },
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
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            text: "Create Account",
          ),
        ],
      ),
    );
  }
}
