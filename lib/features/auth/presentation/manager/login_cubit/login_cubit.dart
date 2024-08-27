import 'package:bloc/bloc.dart';
import 'package:warsha/core/helpers/common_imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoading());
    final response = await authRepo.loginRequest(loginRequest: loginRequest);
    response.fold(
      (failure) => emit(LoginFailed(failure.errorMessage)),
      (loginResponse) => emit(LoginSuccess(loginResponse)),
    );
  }
}
