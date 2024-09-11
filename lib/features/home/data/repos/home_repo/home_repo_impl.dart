import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  final List<CourseModel> _courses = [];

  @override
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    try {
      if (_courses.isEmpty) {
        final response =
            await apiService.get(endPoint: ApiEndpoints.allCourses);
        for (var item in response) {
          _courses.add(CourseModel.fromJson(item));
        }
      }
      return Right(_courses);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
