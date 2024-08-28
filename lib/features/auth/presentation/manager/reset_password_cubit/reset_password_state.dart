part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponse resetPasswordResponse;

  ResetPasswordSuccess(this.resetPasswordResponse);
}
final class ResetPasswordFailure extends ResetPasswordState {
  final String errMessage;

  ResetPasswordFailure(this.errMessage);
}
