import 'package:dartz/dartz.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/data/models/register_data/register_response.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  final CacheNetwork cacheNetwork = GetIt.instance<CacheNetwork>();

  @override
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginUser loginUser}) async {
    try {
      final response = await apiService.post(
        endPoint: "/accounts/login/",
        data: loginUser.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(response);
      cacheNetwork.saveData(key: "token", value: loginResponse.token.access);
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

  @override
  Future<Either<Failure, RegisterResponse>> registerRequest(
      {required RegisterUser registerUser}) async {
    try {
      final response = await apiService.post(
        endPoint: "/accounts/register/",
        data: registerUser.toJson(),
      );
      final registerResponse = RegisterResponse.fromJson(response);
      cacheNetwork.saveData(key: "token", value: registerResponse.token.access);
      return right(registerResponse);
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

  @override
  Future<Either<Failure, SendResetPasswordResponse>> sendResetPassword(
      {required SendResetPasswordData sendResetPasswordData}) async {
    try {
      final response = await apiService.post(
        endPoint: "/accounts/send-reset-password-email/",
        data: sendResetPasswordData.toJson(),
      );
      final sendResetPasswordResponse =
          SendResetPasswordResponse.fromJson(response);
      return Right(sendResetPasswordResponse);
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
