import 'package:dartz/dartz.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/data/models/register_models/register_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginUser loginUser});

  Future<Either<Failure, RegisterResponse>> registerRequest(
      {required RegisterUser registerUser});

  Future<Either<Failure, ResetPasswordResponse>> sendOtp(
      {required SendOtpRequest sendOtpData});

  Future<Either<Failure, ValidateOtpResponse>> validateOtp(
      {required ValidateOtpRequest validateOtpRequest});

  Future<Either<Failure, ResetPasswordResponse>> resetPassword(
      {required ResetPasswordRequest resetPasswordRequest});
}
