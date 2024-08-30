import 'package:warsha/core/helpers/common_imports.dart';

class CourseContentCard extends StatelessWidget {
  const CourseContentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.mainGrey,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.w),
              child: Image.asset("assets/images/test.jpg"),
            ),
          ),
          4.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fatty Liver",
                  style: TextStyles.font18offWhiteSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Author: ",
                        style: TextStyles.font14GreyRegular,
                      ),
                      TextSpan(
                        text: "Khaled Mohamed",
                        style: TextStyles.font14offWhiteMedium,
                      ),
                    ],
                  ),
                ),
                2.verticalSpace,
                Text(
                  "This is the first course",
                  style: TextStyles.font14GreyRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Bootstrap.collection,
                              size: 16.w,
                              color: ColorsManager.mainGreen,
                            ),
                            4.horizontalSpace,
                            Text(
                              "11 Lessons",
                              style: TextStyles.font14offWhiteMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.clock_outline,
                              size: 16.w,
                              color: ColorsManager.mainGreen,
                            ),
                            4.horizontalSpace,
                            Text(
                              "5.4 hours",
                              style: TextStyles.font14offWhiteMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "120 LE",
                      style: TextStyles.font16GreenBold,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
