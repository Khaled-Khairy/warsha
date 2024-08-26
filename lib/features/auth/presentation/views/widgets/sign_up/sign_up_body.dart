import 'package:warsha/core/helpers/common_imports.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const SignUpHeader(),
          10.verticalSpace,
          const SignUpForm(),
        ],
      ),
    );
  }
}
