part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final RegisterResponse registerResponse;

  RegisterSuccess(this.registerResponse);
}
final class RegisterFailed extends RegisterState {
  final String errorMessage;

  RegisterFailed(this.errorMessage);
}
