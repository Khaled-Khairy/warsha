import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit(this.authRepo) : super(SendOtpInitial());
  final AuthRepo authRepo;

  Future<void> sendOtp({required SendOtpRequest sendOtpData}) async {
    emit(SendOtpLoading());
    final result = await authRepo.sendOtp(sendOtpData: sendOtpData);
    result.fold(
      (failure) {
        emit(SendOtpFailed(failure.errorMessage));
      },
      (sendOtpResponse) {
        emit(SendOtpSuccess(sendOtpResponse));
      },
    );
  }
}
