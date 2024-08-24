import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/utils/helpers/font_weight_helper.dart';
import 'package:warsha/core/utils/resources/colors.dart';

abstract class TextStyles {
  // Font Sizes: 32
  static TextStyle font32GreenBold = TextStyle(
    fontSize: 32.sp,
    color: ColorsManager.mainGreen,
    fontWeight: FontWeightHelper.bold,
  );

  // Font Sizes: 26
  static TextStyle font26WhiteBold = TextStyle(
    fontSize: 26.sp,
    color: ColorsManager.offWhite,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font26GreenBold = TextStyle(
    fontSize: 26.sp,
    color: ColorsManager.mainGreen,
    fontWeight: FontWeightHelper.bold,
  );

  // Font Sizes: 16
  static TextStyle font16GreyRegular = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.grey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font20offWhiteSemiBold = TextStyle(
    fontSize: 20.sp,
    color: ColorsManager.offWhite,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16GreenMedium = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.mainGreen,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16GreyMedium = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.grey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16offWhiteMedium = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.offWhite,
    fontWeight: FontWeightHelper.medium,
  );

  // Font Sizes: 14
  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.grey,
    fontWeight: FontWeightHelper.regular,
  );
}
