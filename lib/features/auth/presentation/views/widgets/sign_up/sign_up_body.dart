import 'package:warsha/core/helpers/common_imports.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is SignUpSuccess) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              duration: Duration(seconds: 5),
              content: SnackBarContent(
                message: "Login Success",
              ),
            ),
          );
        } else if (state is SignUpFailed) {
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
              const SignUpHeader(),
              10.verticalSpace,
              const SignUpForm(),
            ],
          ),
        );
      },
    );
  }
}
