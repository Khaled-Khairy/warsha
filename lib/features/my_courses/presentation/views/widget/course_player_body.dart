import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/video_player.dart';

class CoursePlayerBody extends StatefulWidget {
  const CoursePlayerBody({super.key, required this.slug});

  final String slug;

  @override
  State<CoursePlayerBody> createState() => _CoursePlayerBodyState();
}

class _CoursePlayerBodyState extends State<CoursePlayerBody> {
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
            child: VideoPlayer(units: state.courseUnit),
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
