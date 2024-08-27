import 'package:warsha/core/helpers/common_imports.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(AuthRepoImpl(ApiService(Dio()))),
        child: const LoginBody(),
      ),
    );
  }
}
