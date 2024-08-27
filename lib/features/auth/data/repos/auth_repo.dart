import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginRequest loginRequest});

  // Future<Either<Failure, SignUpResponse>> registerRequest(
  //     {required SignUpRequest registerUser});
  //
  // Future<Either<Failure, ResetPasswordResponse>> sendOtp(
  //     {required SendOtpRequest sendOtpData});
  //
  // Future<Either<Failure, ValidateOtpResponse>> validateOtp(
  //     {required ValidateOtpRequest validateOtpRequest});
  //
  // Future<Either<Failure, ResetPasswordResponse>> resetPassword(
  //     {required ResetPasswordRequest resetPasswordRequest});
}
