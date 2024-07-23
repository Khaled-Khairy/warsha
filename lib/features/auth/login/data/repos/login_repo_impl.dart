import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/login/data/models/login_response.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginModel loginModel}) async {
    try {
      final response = await apiService.post(
        endPoint: 'accounts/login/',
        data: loginModel.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(response);
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExecption(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
