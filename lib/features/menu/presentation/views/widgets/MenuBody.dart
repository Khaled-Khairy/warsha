import 'package:warsha/core/helpers/common_imports.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.mainGrey,
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorsManager.mainGreen,
                radius: 20.w,
                child: const Icon(
                  Icons.warehouse_rounded,
                  color: ColorsManager.offWhite,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
