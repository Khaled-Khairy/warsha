import 'package:dartz/dartz.dart';
import 'package:warsha2/core/utils/common_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginModel loginModel});
}
