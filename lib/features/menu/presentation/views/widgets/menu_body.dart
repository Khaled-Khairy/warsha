import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/presentation/views/widgets/log_out_button.dart';

import 'menu_container.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MenuContainer(
          icon: Iconsax.user_outline,
          title: "Khaled Mohamed",
          subtitle: "hy3113194@gmail.com",
        ),
        10.verticalSpace,
        const MenuContainer(
          icon: Iconsax.lock_outline,
          title: "Reset Password",
          subtitle: "reset your account password",
        ),
        20.verticalSpace,
        const LogOutButton(),
      ],
    );
  }
}
