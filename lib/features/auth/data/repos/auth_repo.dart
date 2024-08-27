import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> loginRequest({required LoginRequest loginRequest});
}
