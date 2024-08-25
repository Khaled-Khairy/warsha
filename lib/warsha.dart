import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha/core/utils/resources/colors.dart';
import 'package:warsha/core/routing/app_router.dart';
import 'package:warsha/core/routing/routes.dart';

class Warsha extends StatelessWidget {
  final AppRouter appRouter;

  const Warsha({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: ColorsManager.mainGreen,
            colorScheme: const ColorScheme.dark(
              primary: ColorsManager.mainGreen,
            ),
            scaffoldBackgroundColor: ColorsManager.background,
            // textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
          ),
          initialRoute: Routes.onboardingScreen,
          onGenerateRoute: appRouter.generateRouter,
        );
      },
    );
  }
}
