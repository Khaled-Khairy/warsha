import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/features/onboarding/presentation/views/widgets/doc_logo_and_name.dart';
import 'package:warsha/features/onboarding/presentation/views/widgets/doctor_image_and_text.dart';
import 'package:warsha/features/onboarding/presentation/views/widgets/onboarding_footer.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
              const DocLogoAndName(),
              30.verticalSpace,
              const DoctorImageAndText(),
              const OnboardingFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
