import 'package:warsha/core/helpers/common_imports.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor});

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        backgroundColor: backgroundColor ?? ColorsManager.mainGreen,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 56.h),
      ),
      child: Text(
        text,
        style: TextStyles.font20offWhiteSemiBold,
      ),
    );
  }
}
