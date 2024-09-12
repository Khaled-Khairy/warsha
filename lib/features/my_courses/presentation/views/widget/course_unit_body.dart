import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/expandable_unit.dart';

class CourseUnitBody extends StatefulWidget {
  const CourseUnitBody({super.key, required this.slug});

  final String slug;

  @override
  State<CourseUnitBody> createState() => _CourseUnitBodyState();
}

class _CourseUnitBodyState extends State<CourseUnitBody> {
  @override
  void initState() {
    BlocProvider.of<CourseUnitCubit>(context).getCourseUnit(slug: widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseUnitCubit, CourseUnitState>(
      builder: (context, state) {
        if (state is CourseUnitLoading) {
          return const CircularProgressIndicator(
            color: ColorsManager.mainGreen,
          );
        } else if (state is CourseUnitSuccess) {
          return SafeArea(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.courseUnit.length,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              itemBuilder: (context, index) {
                return ExpandableUnit(
                  unit: state.courseUnit[index],
                  index: index,
                );
              },
            ),
          );
        } else if (state is CourseUnitFailure) {
          return Center(
            child: Text(
              "Failed",
              style: TextStyles.font16offWhiteSemiBold,
            ),
          );
        } else {
          return Center(
            child: Text(
              "Unhandled Error",
              style: TextStyles.font16offWhiteSemiBold,
            ),
          );
        }
      },
    );
  }
}
