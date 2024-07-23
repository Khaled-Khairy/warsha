import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> login({required LoginModel loginModel}) async {
    emit(LoginLoading());
    var result = await loginRepo.loginRequest(loginModel: loginModel);
    result.fold((failure) {
      emit(LoginFailed(failure.errMessage));
    }, (loginResponse) {
      emit(LoginSuccess(loginResponse));
    });
  }
}
