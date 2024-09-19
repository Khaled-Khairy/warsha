import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class MyCoursesRepoImpl implements MyCoursesRepo {
  final ApiService apiService;

  MyCoursesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CourseModel>>> getSubscribedCourses() async {
    try {
      final response = await apiService.get(endPoint: ApiEndpoints.myCourses);
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
