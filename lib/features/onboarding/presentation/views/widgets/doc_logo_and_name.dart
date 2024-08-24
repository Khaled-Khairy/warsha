import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warsha/core/utils/resources/assets.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.docDocLogo),
        10.horizontalSpace,
        Text(
          "Warsha",
          style: TextStyles.font26WhiteBold,
        ),
      ],
    );
  }
}
