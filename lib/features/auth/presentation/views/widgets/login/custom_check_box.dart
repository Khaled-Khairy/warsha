import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.r,
      child: Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(
            () {
              isChecked = value ?? false;
            },
          );
        },
        visualDensity: VisualDensity.compact,
        activeColor: Colors.blue,
        checkColor: Colors.white,
      ),
    );
  }
}
