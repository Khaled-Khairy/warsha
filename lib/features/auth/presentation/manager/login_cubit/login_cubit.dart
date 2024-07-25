import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final AuthRepo loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login({required LoginUser loginModel}) async {
    emit(LoginLoading());
    final result = await loginRepo.loginRequest(loginModel: loginModel);
    result.fold(
      (failure) {
        emit(LoginFailed(failure.errMessage));
      },
      (loginResponse) {
        emit(LoginSuccess(loginResponse));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
