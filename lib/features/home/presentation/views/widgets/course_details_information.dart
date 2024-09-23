import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/manager/update_nav_index/update_nav_index_cubit.dart';

class CourseDetailsInformation extends StatefulWidget {
  const CourseDetailsInformation({
    super.key,
    required this.course,
    required this.subscribedCourses,
  });

  final CourseModel course;
  final List<CourseModel> subscribedCourses;

  @override
  State<CourseDetailsInformation> createState() =>
      _CourseDetailsInformationState();
}

class _CourseDetailsInformationState extends State<CourseDetailsInformation> {
  bool subscribed = false;

  @override
  void initState() {
    subscribed = widget.subscribedCourses
        .any((subscribedCourse) => subscribedCourse.slug == widget.course.slug);
    super.initState();
  }

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
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  "http://image.tmdb.org/t/p/original/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        AppBody(
          verticalPadding: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.course.title,
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
                      text: widget.course.author,
                      style: TextStyles.font14GreenSemiBold,
                    ),
                  ],
                ),
              ),
              4.verticalSpace,
              Text(
                widget.course.description,
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
                            size: 16.w,
                            color: ColorsManager.mainGreen,
                          ),
                          4.horizontalSpace,
                          Text(
                            "${widget.course.numOfLessons} Lessons",
                            style: TextStyles.font14offWhiteMedium,
                          ),
                        ],
                      ),
                      2.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock_outline,
                            size: 16.w,
                            color: ColorsManager.mainGreen,
                          ),
                          4.horizontalSpace,
                          Text(
                            convertMinToHour(
                              widget.course.duration,
                            ),
                            style: TextStyles.font14offWhiteMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "${widget.course.cost} LE",
                    style: TextStyles.font20GreenBold,
                  ),
                ],
              ),
              20.verticalSpace,
              subscribed
                  ? Row(
                      children: [
                        Icon(
                          Iconsax.info_circle_outline,
                          size: 30.w,
                          color: ColorsManager.mainGreen,
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Text(
                            "You have already purchased this course.",
                            style: TextStyles.font16offWhiteMedium,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              20.verticalSpace,
              subscribed
                  ? AppTextButton(
                      onPressed: () {
                        context.read<UpdateNavIndexCubit>().updateIndex(2);
                        context.pop();
                      },
                      text: "Go to MyCourses",
                    )
                  : AppTextButton(
                      onPressed: () {
                        context.pushNamed(Routes.buyNowView,
                            arguments: widget.course.slug);
                      },
                      text: "Buy Now",
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
