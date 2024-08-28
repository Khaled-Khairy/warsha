import 'package:warsha/core/helpers/common_imports.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
            Lottie.asset(
              "assets/lotties/success.json",
              height: 180.h,
              backgroundLoading: true,
              repeat: false,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            Text(
              "Account Created Successfully",
              style: TextStyles.font26GreenBold,
              textAlign: TextAlign.center,
            ),
            Text(
              "You’r account has been created successfully. Please login to continue.",
              style: TextStyles.font16GreyRegular,
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            AppTextButton(
              onPressed: () {
                context.pop();
                context.pop();
              },
              text: "Return to login",
            ),
          ],
        ),
      ),
    );
  }
}
