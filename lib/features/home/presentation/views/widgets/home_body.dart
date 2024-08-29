import 'package:warsha/core/helpers/common_imports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(onPressed: (){
          SharedPrefHelper.clearAllSecuredData();
        }, text: "Go out")
      ],
    );
  }
}
