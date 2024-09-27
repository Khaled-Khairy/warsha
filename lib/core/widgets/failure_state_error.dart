import 'package:warsha/core/helpers/common_imports.dart';

class FailureStateError extends StatelessWidget {
  const FailureStateError({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          Lottie.asset(
            "assets/lotties/error.json",
            height: 240.h,
            backgroundLoading: true,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
          10.verticalSpace,
          Text(
            "Oops! Something went wrong",
            style: TextStyles.font22GreenBold,
            textAlign: TextAlign.center,
          ),
          Text(
            "An error occurred while processing your request. Please try again later.",
            style: TextStyles.font16GreyRegular,
            textAlign: TextAlign.center,
          ),
          4.verticalSpace,
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
