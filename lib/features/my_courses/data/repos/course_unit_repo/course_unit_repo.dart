import 'package:dartz/dartz.dart';
import 'package:warsha/core/errors/failure.dart';
import 'package:warsha/features/my_courses/data/models/course_unit_model.dart';

abstract class CourseUnitRepo{
  Future<Either<Failure,List<CourseUnit>>> getCourseUnit({required String slug});
}