import 'package:flutter/material.dart';
import 'package:warsha/core/utils/resources/colors.dart';

ThemeData theme = ThemeData(
  primaryColor: ColorsManager.mainGreen,
  colorScheme: const ColorScheme.dark(
    primary: ColorsManager.mainGreen,
  ),
  scaffoldBackgroundColor: ColorsManager.background,
);
