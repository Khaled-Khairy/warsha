import 'package:warsha/core/helpers/common_imports.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            "Dive into your courses and start mastering the material today.",
            style: TextStyles.font16GreyRegular,
            textAlign: TextAlign.center,
          ),
          30.verticalSpace,
          AppTextButton(
            onPressed: () {
              context.pushNamed(
                Routes.loginScreen,
              );
            },
            text: "Get Started",
          ),
        ],
      ),
    );
  }
}
