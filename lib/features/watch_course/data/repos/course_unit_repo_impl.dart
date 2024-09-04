import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class CourseUnitRepoImpl implements CourseUnitRepo {
  final ApiService apiService;

  CourseUnitRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CourseUnit>>> getCourseUnit() async {
    try {
      final response = await apiService.get(endPoint: "courses/e3d8be64-c910-4d03-bff9-f4137aec5ec7/units");
      final List<CourseUnit> units = [];
      for (var item in response) {
        units.add(CourseUnit.fromJson(item));
      }
      return right(units);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
