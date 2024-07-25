import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warsha2/core/utils/common_imports.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push("/");
              },
              icon:  Icon(Icons.arrow_back,size: 24.r,),
            ),
          ],
        ),
        Lottie.asset("assets/animation/signup.json",
            width: double.infinity,
            height: 230.h,
            backgroundLoading: true,
            alignment: Alignment.topCenter),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Let’s create your account",
            style: Styles.headLines,
          ),
        ),
      ],
    );
  }
}
