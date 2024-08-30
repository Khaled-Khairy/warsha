import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key,});



  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(getIt.get<AuthRepoImpl>()),
        child: ResetPasswordBody(
          token: token,
        ),
      ),
    );
  }
}
