import 'package:warsha/core/helpers/common_imports.dart';

class AppBody extends StatelessWidget {
  const AppBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: child),
      ),
    );
  }
}
