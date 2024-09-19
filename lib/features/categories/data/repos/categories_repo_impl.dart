import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiService apiService;

  CategoriesRepoImpl(this.apiService);

  final List<Categories> _categories = [];

  @override
  Future<Either<Failure, List<Categories>>> getCategories() async {
    try {
      if (_categories.isEmpty) {
        final response = await apiService.get(endPoint: ApiEndpoints.categories);
        for (var item in response) {
          _categories.add(Categories.fromJson(item));
        }
      }
      return Right(_categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCategoryCourses(
      {required String category}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndpoints.coursesByCategory(category),
      );
      final List<CourseModel> courses = [];

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
