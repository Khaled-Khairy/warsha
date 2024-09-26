import 'package:warsha/core/helpers/common_imports.dart';

class AnimateList extends StatefulWidget {
  const AnimateList({
    super.key,
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  State<AnimateList> createState() => _AnimateListState();
}

class _AnimateListState extends State<AnimateList> {
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
      duration: Duration(milliseconds: 400 + (widget.index * 100)),
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
