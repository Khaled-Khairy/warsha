
import 'package:warsha/core/helpers/common_imports.dart';

part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  ValidateOtpCubit(this.authRepo) : super(ValidateOtpInitial());
  final AuthRepo authRepo;

  Future<void> validateOtp({required ValidateOtpRequest validateOtpRequest}) async {
    emit(ValidateOtpLoading());
    final response = await authRepo.validateOtpRequest(validateOtpRequest: validateOtpRequest);
    response.fold(
      (failure) => emit(ValidateOtpFailed(failure.errorMessage)),
      (validateOtpResponse) => emit(ValidateOtpSuccess(validateOtpResponse)),
    );
  }
}
