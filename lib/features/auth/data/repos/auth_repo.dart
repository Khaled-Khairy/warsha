import 'package:dartz/dartz.dart';
import 'package:warsha2/core/utils/common_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginUser loginModel});

  Future<Either<Failure, LoginResponse>> registerRequest(
      {required LoginUser loginModel});
}
