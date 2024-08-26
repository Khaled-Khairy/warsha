import 'package:warsha/core/helpers/common_imports.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.docDocLogo),
        10.horizontalSpace,
        Text(
          "Warsha",
          style: TextStyles.font26WhiteBold,
        ),
      ],
    );
  }
}
