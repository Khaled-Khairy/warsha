import 'package:warsha2/features/auth/login/data/models/login_response.dart';

import '../../../../../core/utils/common_imports.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginModel loginModel});
}
