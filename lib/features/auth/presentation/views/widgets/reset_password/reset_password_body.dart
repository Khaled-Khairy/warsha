import 'package:warsha/core/helpers/common_imports.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const ResetPasswordHeader(),
          20.verticalSpace,
          const ResetPasswordForm()
        ],
      ),
    );
  }
}
