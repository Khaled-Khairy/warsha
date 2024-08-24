import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/utils/resources/colors.dart';
import 'package:warsha/core/utils/resources/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor});

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        backgroundColor: backgroundColor ?? ColorsManager.mainGreen,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 56.h),
      ),
      child: Text(
        text,
        style: TextStyles.font20offWhiteSemiBold,
      ),
    );
  }
}
