import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/send_otp_cubit/send_otp_cubit.dart';

class SendOtpBody extends StatefulWidget {
  const SendOtpBody({super.key});

  @override
  State<SendOtpBody> createState() => _SendOtpBodyState();
}

class _SendOtpBodyState extends State<SendOtpBody> {
  final TextEditingController emailController = TextEditingController();

  @override
  dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is SendOtpSuccess) {
          context.pushReplacementNamed(
            Routes.validateOtpScreen,
            arguments: emailController.text,
          );
        } else if (state is SendOtpFailed) {
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
              const SendOtpHeader(),
              20.verticalSpace,
              SendOtpForm(
                emailController: emailController,
              )
            ],
          ),
        );
      },
    );
  }
}
