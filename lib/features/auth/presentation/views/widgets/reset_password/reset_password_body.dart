import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is ResetPasswordSuccess) {
          context.pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => SuccessDialog(
              title: "Password Reset Successfully",
              subTitle:
                  "You’r password has been reset successfully. Please login to continue.",
              onPressed: () {
                context.pop();
                context.pop();
                context.pop();
                context.pop();
              },
            ),
          );
        } else if (state is ResetPasswordFailure) {
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
              const ResetPasswordHeader(),
              20.verticalSpace,
              ResetPasswordForm(
                token: token,
              ),
            ],
          ),
        );
      },
    );
  }
}
