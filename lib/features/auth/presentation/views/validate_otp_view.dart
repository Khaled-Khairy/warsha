import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/presentation/manager/validate_otp_cubit/validate_otp_cubit.dart';

class ValidateOtpView extends StatelessWidget {
  const ValidateOtpView({
    super.key, required this.resetPasswordEmail,
  });
  final String resetPasswordEmail;
  @override
  Widget build(BuildContext context) {
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
