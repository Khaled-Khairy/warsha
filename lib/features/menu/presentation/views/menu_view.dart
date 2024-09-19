import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/data/repos/menu_repo_impl.dart';
import 'package:warsha/features/menu/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:warsha/features/menu/presentation/views/widgets/menu_body.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProfileCubit(getIt.get<MenuRepoImpl>())..getProfile(),
          ),
        ],
        child: const Center(child: AppBody(child: MenuBody())),
      ),
    );
  }
}
