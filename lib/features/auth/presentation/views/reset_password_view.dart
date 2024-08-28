import 'package:warsha/core/helpers/common_imports.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordBody(
        token: token,
      ),
    );
  }
}
