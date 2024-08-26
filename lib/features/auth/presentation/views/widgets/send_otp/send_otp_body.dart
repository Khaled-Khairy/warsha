import 'package:warsha/core/helpers/common_imports.dart';

class SendOtpBody extends StatelessWidget {
  const SendOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const SendOtpHeader(),
          20.verticalSpace,
          const SendOtpForm()
        ],
      ),
    );
  }
}
