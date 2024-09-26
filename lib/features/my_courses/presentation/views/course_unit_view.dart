import 'package:url_launcher/url_launcher.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/presentation/views/widget/course_unit_body.dart';

class CourseUnitView extends StatelessWidget {
  const CourseUnitView({super.key});

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Brand(
              Brands.telegram_app,
              size: 50.r,
            ),
            TextButton(
              onPressed: () async {
                const url = 'https://t.me/KhaledFC1';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              style: TextButton.styleFrom(
                overlayColor: const Color(0xff24A1DE),
              ),
              child: Text(
                "Join Telegram Group",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color(0xff24A1DE),
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: ColorsManager.background,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => CourseUnitCubit(getIt.get<CourseUnitRepoImpl>())..getCourseUnit(slug: slug),
        child: const CourseUnitBody(),
      ),
    );
  }
}
