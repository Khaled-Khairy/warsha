import 'package:dartz/dartz.dart';
import 'package:warsha/core/errors/failure.dart';
import 'package:warsha/features/course_categories/data/models/categories.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<Categories>>> getCategories();
}
