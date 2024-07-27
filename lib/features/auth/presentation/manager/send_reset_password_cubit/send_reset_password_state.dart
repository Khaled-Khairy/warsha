part of 'send_reset_password_cubit.dart';

@immutable
sealed class SendResetPasswordState {}

final class SendResetPasswordInitial extends SendResetPasswordState {}

final class SendResetPasswordLoading extends SendResetPasswordState {}

final class SendResetPasswordSuccess extends SendResetPasswordState {
  final SendResetPasswordResponse sendResetPasswordResponse;

  SendResetPasswordSuccess(this.sendResetPasswordResponse);
}

final class SendResetPasswordFailed extends SendResetPasswordState {
  final String errorMessage;

  SendResetPasswordFailed(this.errorMessage);
}
