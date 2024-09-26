import 'package:warsha/core/helpers/common_imports.dart';

class CourseDetailsInformation extends StatefulWidget {
  const CourseDetailsInformation({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  State<CourseDetailsInformation> createState() =>
      _CourseDetailsInformationState();
}

class _CourseDetailsInformationState extends State<CourseDetailsInformation> {


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
              fit: BoxFit.cover,
              imageUrl: "http://13.60.30.244:8000${widget.course.image}",
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
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
               AppTextButton(
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
