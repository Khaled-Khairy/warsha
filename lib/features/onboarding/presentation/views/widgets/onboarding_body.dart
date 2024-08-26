import 'package:warsha/core/helpers/common_imports.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const DocLogoAndName(),
          30.verticalSpace,
          const DoctorImageAndText(),
          const OnboardingFooter(),
        ],
      ),
    );
  }
}
