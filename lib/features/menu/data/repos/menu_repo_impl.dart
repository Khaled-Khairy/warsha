import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/menu/data/repos/menu_repo.dart';

class MenuRepoImpl extends MenuRepo {
  final ApiService apiService;

  MenuRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> logOut() async {
    try {
      final response = await apiService.post(
        endPoint: ApiEndpoints.logOut,
        data: {
          "refresh": await SharedPrefHelper.getString(
            key: SharedPrefKeys.refreshToken,
          ),
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
}
