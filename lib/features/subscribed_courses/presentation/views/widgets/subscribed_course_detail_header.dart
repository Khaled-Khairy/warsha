import 'package:warsha/core/helpers/common_imports.dart';

class SubscribedCourseDetailHeader extends StatelessWidget {
  const SubscribedCourseDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.play_arrow,
            size: 50.w,
            color: ColorsManager.mainGreen,
          ),
        ),
      ],
    );
  }
}
