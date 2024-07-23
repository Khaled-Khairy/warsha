import '../../../../../core/utils/common_imports.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginModel loginModel});
}
