import 'package:flutter/material.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/data/models/register_data/register_response.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> register({required RegisterUser registerUser}) async {
    emit(RegisterLoading());
    final result = await authRepo.registerRequest(registerUser: registerUser);
    result.fold(
      (failure) {
        emit(RegisterFailed(failure.errorMessage));
      },
      (registerResponse) {
        emit(RegisterSuccess(registerResponse));
      },
    );
  }
}
