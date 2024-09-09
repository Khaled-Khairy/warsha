import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CourseModel>>> getAllCourses();
}
