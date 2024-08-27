import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/data/models/sign_up_models/sign_up_response.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({required SignUpRequest signUpRequest}) async {
    emit(SignUpLoading());
    final response = await authRepo.signUpRequest(signUpRequest: signUpRequest);
    response.fold(
      (failure) => emit(SignUpFailed(failure.errorMessage)),
      (signUpResponse) => emit(SignUpSuccess(signUpResponse)),
    );
  }
}
