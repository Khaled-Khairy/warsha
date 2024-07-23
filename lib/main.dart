import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/common_imports.dart';

void main() {
  runApp( const Warsha());
}

class Warsha extends StatelessWidget {
  const Warsha({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const LoginView(),
        );
      },
    );
  }
}
