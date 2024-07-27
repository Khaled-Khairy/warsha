import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required LoginUser loginUser}) async {
    emit(LoginLoading());
    final result = await authRepo.loginRequest(loginUser: loginUser);
    result.fold(
      (failure) {
        emit(LoginFailed(failure.errorMessage));
      },
      (loginResponse) {
        emit(LoginSuccess(loginResponse));
      },
    );
  }
}
