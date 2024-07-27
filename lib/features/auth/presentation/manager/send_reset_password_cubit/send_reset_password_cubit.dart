import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'send_reset_password_state.dart';

class SendResetPasswordCubit extends Cubit<SendResetPasswordState> {
  SendResetPasswordCubit(this.authRepo) : super(SendResetPasswordInitial());
  final AuthRepo authRepo;
  Future<void> sendResetPassword(
      {required SendResetPasswordData sendResetPasswordData}) async {
    emit(SendResetPasswordLoading());
    final result = await authRepo.sendResetPassword(
        sendResetPasswordData: sendResetPasswordData);
    result.fold((failure) {
      emit(SendResetPasswordFailed(failure.errorMessage));
    }, (sendResetPasswordResponse) {
      emit(SendResetPasswordSuccess(sendResetPasswordResponse));
    });
  }
}
