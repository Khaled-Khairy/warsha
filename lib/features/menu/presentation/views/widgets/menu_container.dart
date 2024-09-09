import 'package:warsha/core/helpers/common_imports.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title, subtitle;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font16offWhiteMedium,
              ),
              Text(
                subtitle,
                style: TextStyles.font14GreyRegular,
              )
            ],
          )
        ],
      ),
    );
  }
}
