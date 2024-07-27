import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> resetPassword(
      {required ResetPasswordData resetPasswordData}) async {
    emit(ResetPasswordLoading());
    final result =
        await authRepo.resetPassword(resetPasswordData: resetPasswordData);
    result.fold(
      (failure) {
        emit(ResetPasswordFailed(failure.errorMessage));
      },
      (resetPasswordResponse) {
        emit(ResetPasswordSuccess(resetPasswordResponse));
      },
    );
  }
}
