import 'package:warsha/core/helpers/common_imports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(Routes.sendOtpScreen);
              },
              child: Text(
                "Forget Password?",
                style: TextStyles.font14GreyRegular,
              ),
            ),
          ),
          20.verticalSpace,
          AppTextButton(
            onPressed: () {
              cubit.login(loginRequest: LoginRequest(email: "khaled@gmail.com", password: "khaled777"));
            },
            text: "Login",
          ),
        ],
      ),
    );
  }
}
