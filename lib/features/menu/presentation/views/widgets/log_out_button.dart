import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/presentation/manager/update_nav_index/update_nav_index_cubit.dart';
import 'package:warsha/features/menu/presentation/views/widgets/log_out_dialog.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const LogoutDialog(),
        );
        context.read<UpdateNavIndexCubit>().updateIndex(0);
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.mainGrey,
            radius: 24.w,
            child: Icon(
              Iconsax.logout_bold,
              size: 24.w,
              color: ColorsManager.offWhite,
            ),
          ),
          10.horizontalSpace,
          Text(
            "Log out",
            style: TextStyles.font18offWhiteSemiBold,
          ),
        ],
      ),
    );
  }
}

