import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/networking/dio_factory.dart';
import 'package:warsha/features/auth/data/models/send_otp_models/send_otp_response.dart';
import 'package:warsha/features/auth/data/models/sign_up_models/sign_up_response.dart';

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
      if (loginResponse.message == "Login successful") {
        await SharedPrefHelper.setSecuredString(
          key: SharedPrefKeys.accessToken,
          value: loginResponse.tokens.access,
        );
        await SharedPrefHelper.setSecuredString(
          key: SharedPrefKeys.refreshToken,
          value: loginResponse.tokens.refresh,
        );
        DioFactory.setTokenIntoHeaderAfterLogin(loginResponse.tokens.access);
      }
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, SignUpResponse>> signUpRequest(
      {required SignUpRequest signUpRequest}) async {
    try {
      final response = await apiService.post(
        endPoint: ApiEndpoints.signUp,
        data: signUpRequest.toJson(),
      );
      final signUpResponse = SignUpResponse.fromJson(response);
      return right(signUpResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SendOtpResponse>> sendOtpRequest(
      {required SendOtpRequest sendOtpRequest}) async {
    try {
      final response = await apiService.post(
        endPoint: ApiEndpoints.sendOtp,
        data: sendOtpRequest.toJson(),
      );
      final sendOtpResponse = SendOtpResponse.fromJson(response);
      return right(sendOtpResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
