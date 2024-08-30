import 'package:warsha/core/helpers/common_imports.dart';

class SubscribedCoursesHeader extends StatelessWidget {
  const SubscribedCoursesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Subscribed Courses",
          style: TextStyles.font26GreenBold,
        ),
        const Divider(
          color: ColorsManager.mainGreen,
        )
      ],
    );
  }
}
