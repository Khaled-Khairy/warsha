import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/data/repos/home_repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    try {
      final response = await apiService.get(endPoint: ApiEndpoints.allCourses);
      List<CourseModel> courses = [];
      for (var item in response) {
        courses.add(CourseModel.fromJson(item));
      }
      return Right(courses);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
