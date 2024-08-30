import 'package:warsha/core/helpers/common_imports.dart';

class AppBody extends StatelessWidget {
  const AppBody({
    super.key,
    required this.child,
    this.verticalPadding,
    this.horizontalPadding,
  });

  final Widget child;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 16.w,
            vertical: verticalPadding ?? 16.h,
          ),
          child: child,
        ),
      ),
    );
  }
}
