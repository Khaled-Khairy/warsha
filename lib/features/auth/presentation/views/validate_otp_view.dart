import 'package:warsha/core/helpers/common_imports.dart';

class ValidateOtpView extends StatelessWidget {
  const ValidateOtpView({super.key, required this.resetPasswordEmail});

  final String resetPasswordEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValidateOtpBody(
        resetPasswordEmail: resetPasswordEmail,
      ),
    );
  }
}
