import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';


class CourseUnitRepoImpl implements CourseUnitRepo {
  final ApiService apiService;

  CourseUnitRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CourseUnit>>> getCourseUnit(
      {required String slug}) async {
    try {
      final response = await apiService.get(endPoint: "courses/$slug/units");
      final List<CourseUnit> unit = [];
      for (var item in response) {
        unit.add(CourseUnit.fromJson(item));
      }
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BuyNowResponse>> getSubscriptionStatus({required String slug}) async{
    try {
      final response = await apiService.get(endPoint: ApiEndpoints.getSubscriptionStatus(slug));
      final BuyNowResponse subscriptionStatus = BuyNowResponse.fromJson(response[0]);
      return right(subscriptionStatus);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
