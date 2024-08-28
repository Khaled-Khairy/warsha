import 'package:warsha/core/helpers/common_imports.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    emit(ResetPasswordLoading());
    final response = await authRepo.resetPasswordRequest(resetPasswordRequest: resetPasswordRequest);
    response.fold(
      (failure) => emit(ResetPasswordFailure(failure.errorMessage)),
      (resetPasswordRequest) => emit(ResetPasswordSuccess(resetPasswordRequest)),
    );
  }
}
