import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/data/repos/menu_repo_impl.dart';
import 'package:warsha/features/menu/presentation/manager/log_out_cubit/log_out_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutCubit(getIt.get<MenuRepoImpl>()),
      child: BlocConsumer<LogOutCubit, LogOutState>(
        listener: (context, state) {
          if (state is LogOutSuccess) {
            context.pushNamedAndRemoveUntil(Routes.onboardingScreen,
                predicate: (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                duration: const Duration(seconds: 3),
                content: SnackBarContent(
                  message: state.message,
                  color: ColorsManager.successColor,
                  icon: Icons.check,
                ),
              ),
            );
          } else if (state is LogOutFailed) {
            context.pop();
            showSnackBar(context: context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: ColorsManager.background,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Are you sure you want to log out?",
                    style: TextStyles.font26GreenBold,
                    textAlign: TextAlign.center,
                  ),
                  10.verticalSpace,
                  AppTextButton(
                      onPressed: () {
                        BlocProvider.of<LogOutCubit>(context).logOut();
                      },
                      text: "Log out"),
                  10.verticalSpace,
                  AppTextButton(
                    onPressed: () {
                      context.pop();
                    },
                    text: "Cancel",
                    backgroundColor: ColorsManager.mainGrey,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
