import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/data/models/course_unit_model.dart';
import 'package:warsha/features/my_courses/data/repos/course_unit_repo/course_unit_repo.dart';

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
}
