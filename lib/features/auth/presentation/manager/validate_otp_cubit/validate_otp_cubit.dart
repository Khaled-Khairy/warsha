import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  ValidateOtpCubit(this.authRepo) : super(ValidateOtpInitial());
  final AuthRepo authRepo;

  Future<void> validateOtp(
      {required ValidateOtpRequest validateOtpRequest}) async {
    emit(ValidateOtpLoading());
    final result =
        await authRepo.validateOtp(validateOtpRequest: validateOtpRequest);
    return result.fold(
      (failure) {
        emit(ValidateOtpFailed(failure.errorMessage));
      },
      (validateOtpResponse) {
        emit(ValidateOtpSuccess(validateOtpResponse));
      },
    );
  }
}
