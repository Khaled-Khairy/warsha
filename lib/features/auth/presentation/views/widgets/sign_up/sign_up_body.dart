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
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is SignUpSuccess) {
          context.pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => SuccessDialog(
              title: "Account Created Successfully",
              subTitle: "You’r account has been created successfully. Please login to continue.",
              onPressed: () {
                context.pop();
                context.pop();
              },
            ),
          );
        } else if (state is SignUpFailure) {
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
