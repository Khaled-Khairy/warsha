import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:warsha/features/menu/presentation/views/widgets/change_password_form.dart';
import 'package:warsha/features/menu/presentation/views/widgets/change_password_header.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoading(),
          );
        } else if (state is ChangePasswordSuccess) {
          FocusScope.of(context).unfocus();
          context.pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => SuccessDialog(
              title: "Password Changed Successfully",
              subTitle: "You’r password has been Changed successfully.",
              buttonText: "Confirm",
              onPressed: () {
                context.pop();
                context.pop();
              },
            ),
          );
        } else if (state is ChangePasswordFailed) {
          context.pop();
          showSnackBar(context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return AppBody(
          child: Column(
            children: [
              const ChangePasswordHeader(),
              20.verticalSpace,
              const ChangePasswordForm(),
            ],
          ),
        );
      },
    );
  }
}
