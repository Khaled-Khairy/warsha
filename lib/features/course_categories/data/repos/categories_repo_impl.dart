import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiService apiService;

  CategoriesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Categories>>> getCategories() async {
    try {
      final response = await apiService.get(endPoint: ApiEndpoints.categories);
      List<Categories> categories = [];
      for (var item in response) {
        categories.add(Categories.fromJson(item));
      }
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
