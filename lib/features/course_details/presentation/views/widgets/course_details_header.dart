import 'package:warsha/core/helpers/common_imports.dart';

class CourseDetailsHeader extends StatelessWidget {
  const CourseDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.w),
              bottomRight: Radius.circular(12.w),
            ),
            child: Image.asset("assets/images/test.jpg"),
          ),
        ),
        Positioned(
          top: 12.h,
          left: 8.w,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.w,
              color: ColorsManager.mainGreen,
            ),
          ),
        ),
      ],
    );
  }
}
