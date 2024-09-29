import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/data/models/change_password/change_password_request.dart';
import 'package:warsha/features/menu/data/models/change_password/change_password_response.dart';
import 'package:warsha/features/menu/data/models/profile.dart';
import 'package:warsha/features/menu/data/repos/menu_repo.dart';

class MenuRepoImpl extends MenuRepo {
  final ApiService apiService;

  MenuRepoImpl(this.apiService);

  bool _isProfileLoaded = false;
  Profile? _cachedProfile;

  @override
  Future<Either<Failure, String>> logOut() async {
    try {
      final response = await apiService.post(
        endPoint: ApiEndpoints.logOut,
        data: {
          "refresh": await SharedPrefHelper.getString(key: SharedPrefKeys.refreshToken),
        },
      );
      await SharedPrefHelper.clearAllData();
      return right(response["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    if (_isProfileLoaded) {
      return right(_cachedProfile!);
    }
    try {
      final response = await apiService.get(endPoint: ApiEndpoints.profile);
      final profile = Profile.fromJson(response);
      _cachedProfile = profile;
      _isProfileLoaded = true;
      return right(profile);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ChangePasswordResponse>> changePassword(
      {required ChangePasswordRequest changePasswordRequest}) async {
    try {
      final response = await apiService.post(
        endPoint: ApiEndpoints.changePassword,
        data: changePasswordRequest.toJson(),
      );
      final changePasswordResponse = ChangePasswordResponse.fromJson(response);
      return right(changePasswordResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
