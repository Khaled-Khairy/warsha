part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}
final class ChangePasswordLoading extends ChangePasswordState {}
final class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordResponse changePasswordResponse;
  ChangePasswordSuccess(this.changePasswordResponse);
}
final class ChangePasswordFailed extends ChangePasswordState {
  final String errorMessage;
  ChangePasswordFailed(this.errorMessage);
}
