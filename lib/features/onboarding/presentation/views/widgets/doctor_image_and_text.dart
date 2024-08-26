import 'package:warsha/core/helpers/common_imports.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: AspectRatio(
            aspectRatio: 0.8,
            child: SvgPicture.asset(
              Assets.docDocLogoLowOpacity,
            ),
          ),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsManager.background,
                ColorsManager.background.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.5],
            ),
          ),
          child: AspectRatio(
            aspectRatio: 0.8,
            child: Image.asset(
              Assets.onboardingDoctor,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Text(
            "Start Learning",
            style: TextStyles.font32GreenBold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
