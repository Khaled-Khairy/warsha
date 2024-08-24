import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/utils/helpers/extensions.dart';
import 'package:warsha/core/utils/resources/styles.dart';
import 'package:warsha/core/utils/routing/routes.dart';
import 'package:warsha/core/widgets/get_started_button.dart';

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
