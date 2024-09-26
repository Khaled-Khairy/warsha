import 'package:warsha/core/helpers/common_imports.dart';

class AnimateWidget extends StatefulWidget {
  const AnimateWidget({
    super.key,
    required this.child, required this.index,
  });

  final int index;
  final Widget child;

  @override
  State<AnimateWidget> createState() => _AnimateWidgetState();
}

class _AnimateWidgetState extends State<AnimateWidget> {
  bool myAnimation = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        myAnimation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400 + (widget.index  * 100)),
      curve: Curves.easeIn,
      transform: Matrix4.translationValues(
        myAnimation ? 0 : 360.w,
        0,
        0,
      ),
      child: widget.child,
    );
  }
}
