import 'package:warsha/core/helpers/common_imports.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit(this.authRepo) : super(SendOtpInitial());
  final AuthRepo authRepo;

  Future<void> sendOtp({required SendOtpRequest sendOtpRequest}) async {
    emit(SendOtpLoading());
    final response = await authRepo.sendOtpRequest(sendOtpRequest: sendOtpRequest);
    response.fold(
      (failure) => emit(SendOtpFailure(failure.errorMessage)),
      (sendOtpResponse) => emit(SendOtpSuccess(sendOtpResponse)),
    );
  }
}
