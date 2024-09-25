import 'package:warsha/core/helpers/common_imports.dart';

class NothingFound extends StatelessWidget {
  const NothingFound({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBody(
        child: Column(
          children: [
            Lottie.asset(
              "assets/lotties/empty.json",
              height: 240.h,
              backgroundLoading: true,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            10.verticalSpace,
            Text(
              title,
              style: TextStyles.font26GreenBold,
            ),
            Text(
              subTitle,
              style: TextStyles.font16GreyRegular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
