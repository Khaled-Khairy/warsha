import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/presentation/views/widgets/log_out_button.dart';
import 'package:warsha/features/menu/presentation/views/widgets/profile_section.dart';

import 'menu_container.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileSection(),
        10.verticalSpace,
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.changePasswordView);
          },
          child: const MenuContainer(
            icon: Iconsax.lock_outline,
            title: "Change Password",
            subtitle: "Change your account password",
            isLoading: false,
          ),
        ),
        20.verticalSpace,
        const LogOutButton(),
      ],
    );
  }
}
