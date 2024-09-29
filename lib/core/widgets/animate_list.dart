import 'package:warsha/core/helpers/common_imports.dart';

class AnimateListItem extends StatefulWidget {
  const AnimateListItem({
    super.key,
    required this.child, required this.index,
  });

  final int index;
  final Widget child;

  @override
  State<AnimateListItem> createState() => _AnimateListItemState();
}

class _AnimateListItemState extends State<AnimateListItem> {
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
      curve: Curves.decelerate,
      transform: Matrix4.translationValues(
        myAnimation ? 0 : 360.w,
        0,
        0,
      ),
      child: widget.child,
    );
  }
}
