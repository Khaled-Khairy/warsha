import 'package:warsha/core/helpers/common_imports.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
            color: ColorsManager.background.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20.w)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: ColorsManager.offWhite,
            ),
            10.verticalSpace,
            Text(
              "Loading...",
              style: TextStyles.font16offWhiteSemiBold,
            )
          ],
        ),
      ),
    );
  }
}
