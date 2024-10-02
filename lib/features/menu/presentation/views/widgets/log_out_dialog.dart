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
            showSnackBar(context: context, message: "Logout Failed");
          }
        },
        builder: (context, state) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: ColorsManager.background,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Log out",
                    style: TextStyles.font20GreenSemiBold,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "You will need to log in again to access your account.",
                    style: TextStyles.font16GreyMedium,
                    textAlign: TextAlign.start,
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyles.font16offWhiteMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<LogOutCubit>().logOut();
                        },
                        child: Text(
                          "Log out",
                          style: TextStyles.font18GreenSemiBold,
                        ),
                      )
                    ],
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
