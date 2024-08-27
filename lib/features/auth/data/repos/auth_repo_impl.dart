import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginRequest loginRequest}) async {
    try {
      final response = await apiService.post(
        endPoint: ApiEndpoints.login,
        data: loginRequest.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(response);
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
