import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

abstract class Styles {
  static TextStyle headLines = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle underHeadlines(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle labelStyle(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle bodyBold = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold);

  static TextStyle bodyNormal(BuildContext context) {
    return TextStyle(
      fontSize: 16.sp,
    );
  }

  static TextStyle form = TextStyle(
    fontSize: 14.sp,
  );
}
