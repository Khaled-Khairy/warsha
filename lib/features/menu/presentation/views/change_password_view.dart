import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/data/repos/menu_repo_impl.dart';
import 'package:warsha/features/menu/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:warsha/features/menu/presentation/views/widgets/change_password_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => ChangePasswordCubit(getIt.get<MenuRepoImpl>()),
        child: const ChangePasswordBody(),
      ),
    );
  }
}
