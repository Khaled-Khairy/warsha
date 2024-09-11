import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

abstract class MyCoursesRepo {
  Future<Either<Failure,List<CourseModel>>> getSubscribedCourses();
}