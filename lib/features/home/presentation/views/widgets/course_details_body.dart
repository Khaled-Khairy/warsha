import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/widgets/app_network_image.dart';

class CourseDetailsBody extends StatelessWidget {
  const CourseDetailsBody({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.w),
              bottomRight: Radius.circular(12.w),
            ),
            child: AppNetworkImage(course: course),
          ),
        ),
        AppBody(
          verticalPadding: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title,
                style: TextStyles.font18offWhiteSemiBold,
              ),
              4.verticalSpace,
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
              4.verticalSpace,
              Text(
                course.description,
                style: TextStyles.font14GreyRegular,
              ),
              8.verticalSpace,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Bootstrap.collection,
                            size: 20.w,
                            color: ColorsManager.mainGreen,
                          ),
                          4.horizontalSpace,
                          Text(
                            "${course.numOfLessons} Lessons",
                            style: TextStyles.font14offWhiteMedium,
                          ),
                        ],
                      ),
                      2.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock_outline,
                            size: 20.w,
                            color: ColorsManager.mainGreen,
                          ),
                          4.horizontalSpace,
                          Text(
                            convertMinToHour(
                              course.duration,
                            ),
                            style: TextStyles.font14offWhiteMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "${course.cost} LE",
                    style: TextStyles.font20GreenBold,
                  ),
                ],
              ),
              20.verticalSpace,
              AppTextButton(
                onPressed: () {
                  context.pushNamed(
                    Routes.buyNowView,
                    arguments: {
                      "slug": course.slug,
                      "course_state": "under_review",
                    },
                  );
                },
                text: "Buy Course",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
