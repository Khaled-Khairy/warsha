import 'package:warsha/core/helpers/common_imports.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isLoading,
  });

  final IconData icon;
  final String title, subtitle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.mainGrey,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.mainGreen,
            radius: 24.w,
            child: Icon(
              icon,
              size: 24.w,
              color: ColorsManager.offWhite,
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLoading) Container(
                        height: 10.h,
                        width: 120.w,
                        margin: EdgeInsets.only(bottom: 6.h),
                        decoration: BoxDecoration(
                          color: ColorsManager.darkerGrey,
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                      ) else Text(
                        title,
                        style: TextStyles.font16offWhiteMedium,
                      ),
                if (isLoading) Container(
                        height: 10.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                          color: ColorsManager.darkerGrey,
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                      ) else Text(
                        subtitle,
                        style: TextStyles.font14GreyRegular,
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
