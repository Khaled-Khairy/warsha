import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/send_otp_cubit/send_otp_cubit.dart';

class SendOtpView extends StatelessWidget {
  const SendOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SendOtpCubit(getIt.get<AuthRepoImpl>()),
        child: const SendOtpBody(),
      ),
    );
  }
}
