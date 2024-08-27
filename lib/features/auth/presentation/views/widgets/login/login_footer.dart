import 'package:warsha/core/helpers/common_imports.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
