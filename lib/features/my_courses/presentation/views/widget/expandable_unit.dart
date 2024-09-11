import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/data/models/course_unit_model.dart';
import 'package:warsha/features/my_courses/presentation/manager/course_player_cubit/course_player_cubit.dart';

class ExpandableUnit extends StatefulWidget {
  const ExpandableUnit({super.key, required this.unit, required this.index});

  final CourseUnit unit;
  final int index;

  @override
  State<ExpandableUnit> createState() => _ExpandableUnitState();
}

class _ExpandableUnitState extends State<ExpandableUnit> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: ColorsManager.mainGrey,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.index + 1}.${widget.unit.title}",
                          style: TextStyles.font18GreenSemiBold,
                        ),
                        Text(
                          widget.unit.description,
                          style: TextStyles.font14offWhiteMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                    child: AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.arrow_drop_up,
                        size: 30.w,
                        color: isExpanded
                            ? ColorsManager.mainGreen
                            : ColorsManager.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            ListView.builder(
              itemCount: widget.unit.lessons.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final lesson = widget.unit.lessons[index];
                if (lesson.active) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<CoursePlayerCubit>(context)
                            .updateVideoUrl(lesson.videoUrl);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          color: ColorsManager.mainGrey,
                          borderRadius: BorderRadius.circular(6.w),
                          boxShadow: const [
                            BoxShadow(
                              color: ColorsManager.mainGreen,
                              offset: Offset(2, 2),
                              spreadRadius: 1,
                              blurRadius: 0.5,
                            ),
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(-2, -2),
                              spreadRadius: 1,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Text(
                          "${lesson.order}. ${lesson.title}",
                          style: TextStyles.font16offWhiteMedium,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
        ],
      ),
    );
  }
}
