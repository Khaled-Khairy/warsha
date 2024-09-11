import 'package:flutter/cupertino.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    super.key,
    required this.message, this.icon, this.color,
  });

  final String message;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: color ?? ColorsManager.errorColor,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon ?? Iconsax.info_circle_outline,
            size: 30.w,
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyles.font16offWhiteMedium,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            icon: Icon(
              CupertinoIcons.clear,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
