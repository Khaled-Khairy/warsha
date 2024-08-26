import 'package:warsha/core/helpers/common_imports.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.w,
          ),
        ),
        Center(
          child: Lottie.asset(
            "assets/lotties/signup.json",
            height: 220.h,
            backgroundLoading: true,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "Let’s create your account",
          style: TextStyles.font26GreenBold,
        ),
      ],
    );
  }
}
