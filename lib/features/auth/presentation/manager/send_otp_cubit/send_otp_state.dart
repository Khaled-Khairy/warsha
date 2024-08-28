part of 'send_otp_cubit.dart';

@immutable
sealed class SendOtpState {}

final class SendOtpInitial extends SendOtpState {}
final class SendOtpLoading extends SendOtpState {}
final class SendOtpSuccess extends SendOtpState {
  final SendOtpResponse sendOtpResponse;

  SendOtpSuccess(this.sendOtpResponse);
}
final class SendOtpFailure extends SendOtpState {
  final String errMessage;

  SendOtpFailure(this.errMessage);
}
