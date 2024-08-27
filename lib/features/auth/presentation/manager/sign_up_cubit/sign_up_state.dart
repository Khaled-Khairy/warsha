part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUpResponse signUpResponse;

  SignUpSuccess(this.signUpResponse);
}

final class SignUpFailed extends SignUpState {
  final String errMessage;

  SignUpFailed(this.errMessage);
}
