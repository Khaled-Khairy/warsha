import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: AppColors.errorColor,
          borderRadius: BorderRadius.circular(12).r,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Icon(
              Iconsax.info_circle_outline,
              color: AppColors.darkPrimaryTextColor,
              size: 30.r,
            ),
            5.horizontalSpace,
            Text(
              message,
              style: TextStyle(
                color: AppColors.darkPrimaryTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ),
  );
}
