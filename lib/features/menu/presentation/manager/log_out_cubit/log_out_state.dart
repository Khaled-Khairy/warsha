part of 'log_out_cubit.dart';

@immutable
sealed class LogOutState {}

final class LogOutInitial extends LogOutState {}

final class LogOutLoading extends LogOutState {}

final class LogOutSuccess extends LogOutState {
  final String message;

  LogOutSuccess(this.message);
}

final class LogOutFailed extends LogOutState {
  final String errMessage;

  LogOutFailed(this.errMessage);
}
