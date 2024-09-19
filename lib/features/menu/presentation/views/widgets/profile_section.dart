import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:warsha/features/menu/presentation/views/widgets/menu_container.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const MenuContainer(
            icon: Iconsax.user_outline,
            title: "",
            subtitle: "",
            isLoading: true,
          );
        } else if (state is ProfileSuccess) {
          return MenuContainer(
            icon: Iconsax.user_outline,
            title: state.profile.username,
            subtitle: state.profile.email,
            isLoading: false,
          );
        } else if (state is ProfileFailure) {
          return MenuContainer(
            icon: Iconsax.user_outline,
            title: state.errorMessage,
            subtitle: "",
            isLoading: false,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
