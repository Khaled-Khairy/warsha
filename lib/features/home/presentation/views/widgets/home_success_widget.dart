import 'package:warsha/core/helpers/common_imports.dart';

class HomeSuccessWidget extends StatelessWidget {
  const HomeSuccessWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeTopSection(),
          10.verticalSpace,
           const HomeCoursesList(),
          20.verticalSpace,
          AppTextButton(
            onPressed: () {
              SharedPrefHelper.clearAllData();
            },
            text: "Go out",
          )
        ],
      ),
    );
  }
}
