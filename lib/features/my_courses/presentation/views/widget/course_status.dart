import 'package:warsha/core/helpers/common_imports.dart';

class CourseStatus extends StatelessWidget {
  const CourseStatus(
      {super.key, required this.lottie, required this.state, required this.message, this.animationLoop});

  final String lottie;
  final String state;
  final String message;
  final bool? animationLoop;
  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          Lottie.asset(
            lottie,
            height: 240.h,
            backgroundLoading: true,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            repeat: animationLoop ?? true,
          ),
          10.verticalSpace,
          Text(
            state,
            style: TextStyles.font26GreenBold,
            textAlign: TextAlign.center,
          ),
          Text(
            message,
            style: TextStyles.font16GreyRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
