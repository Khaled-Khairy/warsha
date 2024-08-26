import 'package:warsha/core/helpers/common_imports.dart';

class ValidateOtpBody extends StatelessWidget {
  const ValidateOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const ValidateOtpHeader(),
          20.verticalSpace,
          const ValidateOtpForm()
        ],
      ),
    );
  }
}
