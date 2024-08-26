import 'package:warsha/core/helpers/common_imports.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Lottie.asset(
            "assets/lotties/welcome_back.json",
            height: 240.h,
            backgroundLoading: true,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "Welcome Back",
          style: TextStyles.font26GreenBold,
        ),
        Text(
          "We’re excited to have you back, can’t wait to see what you've been up to since you last logged in.",
          style: TextStyles.font16GreyRegular,
        ),
      ],
    );
  }
}
