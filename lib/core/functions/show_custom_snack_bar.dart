import 'package:flutter/material.dart';
import 'package:warsha2/core/widgets/custom_snack_bar_content.dart';

void showCustomSnackBar(BuildContext context, String message, Color color,
    IconData icon, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomSnackBarContent(
        message: message,
        color: color,
        icon: icon,
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
    ),
  );
}
