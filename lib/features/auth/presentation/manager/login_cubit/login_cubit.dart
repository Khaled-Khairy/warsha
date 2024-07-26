import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
