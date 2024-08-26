import 'package:warsha/core/helpers/common_imports.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const LoginHeader(),
          30.verticalSpace,
          const LoginForm(),
          20.verticalSpace,
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.signUpScreen);
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyles.font14GreyRegular,
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyles.font16GreenMedium,
                  ),
                ],
              ),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
