import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    super.key,
    required this.message,
    required this.color,
    required this.icon,
  });

  final String message;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12).r,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.darkPrimaryTextColor,
            size: 35.r,
          ),
          5.horizontalSpace,
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: AppColors.darkPrimaryTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
