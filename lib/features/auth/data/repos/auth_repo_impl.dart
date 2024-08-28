import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/core/helpers/shared_pref_helper.dart';
import 'package:warsha/core/helpers/shared_pref_keys.dart';
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
        await SharedPrefHelper.clearAllData();
        // await SharedPrefHelper.setData(
        //   key: SharedPrefKeys.accessToken,
        //   value: loginResponse.tokens.access,
        // );
        // await SharedPrefHelper.setData(
        //   key: SharedPrefKeys.refreshToken,
        //   value: loginResponse.tokens.refresh,
        // );
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
}
