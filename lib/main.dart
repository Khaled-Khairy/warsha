import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warsha/core/utils/resources/colors.dart';
import 'package:warsha/core/routing/app_router.dart';
import 'package:warsha/warsha.dart';

void main() {
  runApp(
    Warsha(
      appRouter: AppRouter(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorsManager.mainGreen, // navigation bar color
      statusBarColor: ColorsManager.mainGreen, // status bar color
    ),
  );
}
