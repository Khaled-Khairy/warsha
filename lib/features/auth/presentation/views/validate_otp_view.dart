import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';

class ValidateOtpView extends StatelessWidget {
  const ValidateOtpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String resetPasswordEmail = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: BlocProvider(
        create: (context) => ValidateOtpCubit(getIt.get<AuthRepoImpl>()),
        child: ValidateOtpBody(
          resetPasswordEmail: resetPasswordEmail,
        ),
      ),
    );
  }
}
