import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';

class ValidateOtpBody extends StatelessWidget {
  const ValidateOtpBody({super.key, required this.resetPasswordEmail});

  final String resetPasswordEmail;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
      listener: (context, state) {
        if (state is ValidateOtpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is ValidateOtpSuccess) {
          context.pushReplacementNamed(
            Routes.resetPasswordScreen,
            arguments: state.validateOtpResponse.token,
          );
        } else if (state is ValidateOtpFailed) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              duration: const Duration(seconds: 5),
              content: SnackBarContent(
                message: state.errMessage,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return AppBody(
          child: Column(
            children: [
              const ValidateOtpHeader(),
              20.verticalSpace,
              ValidateOtpForm(
                resetPasswordEmail: resetPasswordEmail,
              )
            ],
          ),
        );
      },
    );
  }
}
