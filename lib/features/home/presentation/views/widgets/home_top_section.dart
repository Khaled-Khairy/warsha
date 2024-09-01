import 'package:warsha/core/helpers/common_imports.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              child: Icon(
                Iconsax.user_outline,
                color: ColorsManager.offWhite,
                size: 24.w,
              ),
            ),
            6.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font14GreyRegular),
                Text("Khaled", style: TextStyles.font16GreenMedium),
              ],
            ),
          ],
        ),

      ],
    );
  }
}
