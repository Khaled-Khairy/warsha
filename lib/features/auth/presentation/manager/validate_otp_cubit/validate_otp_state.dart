part of 'validate_otp_cubit.dart';

@immutable
sealed class ValidateOtpState {}

final class ValidateOtpInitial extends ValidateOtpState {}

final class ValidateOtpLoading extends ValidateOtpState {}

final class ValidateOtpSuccess extends ValidateOtpState {
  final ValidateOtpResponse validateOtpResponse;

  ValidateOtpSuccess(this.validateOtpResponse);
}

final class ValidateOtpFailure extends ValidateOtpState {
  final String errMessage;

  ValidateOtpFailure(this.errMessage);
}
