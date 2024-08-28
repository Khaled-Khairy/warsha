import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/data/models/send_otp_models/send_otp_response.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit(this.authRepo) : super(SendOtpInitial());
  final AuthRepo authRepo;

  Future<void> sendOtp({required SendOtpRequest sendOtpRequest}) async {
    emit(SendOtpLoading());
    final response = await authRepo.sendOtpRequest(sendOtpRequest: sendOtpRequest);
    response.fold(
      (failure) => emit(SendOtpFailed(failure.errorMessage)),
      (sendOtpResponse) => emit(SendOtpSuccess(sendOtpResponse)),
    );
  }
}
