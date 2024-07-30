import 'package:dartz/dartz.dart';
import 'package:warsha2/core/utils/common_imports.dart';
import 'package:warsha2/features/auth/data/models/register_models/register_response.dart';


class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  final CacheNetwork cacheNetwork = GetIt.instance<CacheNetwork>();

  @override
  Future<Either<Failure, LoginResponse>> loginRequest(
      {required LoginUser loginUser}) async {
    try {
      final response = await apiService.post(
        endPoint: "user/login/",
        data: loginUser.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(response);
      cacheNetwork.saveData(key: "access", value: loginResponse.tokens.access);
      cacheNetwork.saveData(
          key: "refresh", value: loginResponse.tokens.refresh);
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
        endPoint: "user/signup/",
        data: registerUser.toJson(),
      );
      final registerResponse = RegisterResponse.fromJson(response);
      cacheNetwork.saveData(
          key: "token", value: registerResponse.tokens.access);
      cacheNetwork.saveData(
          key: "refresh", value: registerResponse.tokens.refresh);
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
  Future<Either<Failure, ResetPasswordResponse>> sendOtp(
      {required SendOtpRequest sendOtpData}) async {
    try {
      final response = await apiService.post(
        endPoint: "user/send-otp/",
        data: sendOtpData.toJson(),
      );
      final sendOtpResponse = ResetPasswordResponse.fromJson(response);
      return Right(sendOtpResponse);
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
  Future<Either<Failure, ValidateOtpResponse>> validateOtp(
      {required ValidateOtpRequest validateOtpRequest}) async {
    try {
      final response = await apiService.post(
        endPoint: "user/validate-otp/",
        data: validateOtpRequest.toJson(),
      );
      final validateOtpResponse = ValidateOtpResponse.fromJson(response);
      return Right(validateOtpResponse);
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
  Future<Either<Failure, ResetPasswordResponse>> resetPassword(
      {required ResetPasswordRequest resetPasswordRequest}) async {
    try {
      final response = await apiService.post(
          endPoint: "user/reset-password/", data: resetPasswordRequest.toJson());
      final resetPasswordResponse = ResetPasswordResponse.fromJson(response);
      return Right(resetPasswordResponse);
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
