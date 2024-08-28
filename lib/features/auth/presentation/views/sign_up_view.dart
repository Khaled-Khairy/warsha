import 'package:warsha/core/helpers/common_imports.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt.get<AuthRepoImpl>()),
        child: const SignUpBody(),
      ),
    );
  }
}
