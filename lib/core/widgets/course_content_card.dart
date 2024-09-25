import 'package:warsha/core/helpers/common_imports.dart';

class CourseContentCard extends StatelessWidget {
  const CourseContentCard({
    super.key,
    required this.course,
  });

  final CourseModel course;

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
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "http://16.171.151.13:8000/${course.image}",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          4.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyles.font18offWhiteSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                 SizedBox(
                   width: 220.w,
                   child: const Divider(
                     color: ColorsManager.darkerGrey,
                   ),
                 ),
                2.verticalSpace,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Author: ",
                        style: TextStyles.font14offWhiteMedium,
                      ),
                      TextSpan(
                        text: course.author,
                        style: TextStyles.font14GreenSemiBold,
                      ),
                    ],
                  ),
                ),
                2.verticalSpace,
                // Text(
                //   course.description,
                //   style: TextStyles.font14GreyRegular,
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
                4.verticalSpace,
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
                              "${course.numOfLessons} Lessons",
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
                              convertMinToHour(course.duration),
                              style: TextStyles.font14offWhiteMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "${course.cost} LE",
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
