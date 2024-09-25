import 'package:warsha/core/helpers/common_imports.dart';

class AnimateList extends StatelessWidget {
  const AnimateList({
    super.key,
    required this.myAnimation,
    required this.index,
    required this.child,
  });

  final bool myAnimation;
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 70)),
      curve: Curves.easeIn,
      transform: Matrix4.translationValues(
        myAnimation ? 0 : 360.w,
        0,
        0,
      ),
      child: child,
    );
  }
}
