import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/auth/data/models/sign_up_models/sign_up_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest({required LoginRequest loginRequest});

  Future<Either<Failure, SignUpResponse>> signUpRequest({required SignUpRequest signUpRequest});
}
