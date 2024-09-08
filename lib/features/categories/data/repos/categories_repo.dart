import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<Categories>>> getCategories();

  Future<Either<Failure, List<CourseModel>>> getCategoryCourses({required String category});
}
