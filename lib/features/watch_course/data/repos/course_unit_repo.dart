import 'package:dartz/dartz.dart';
import 'package:warsha/core/errors/failure.dart';
import 'package:warsha/features/watch_course/data/models/course_unit_model.dart';

abstract class CourseUnitRepo{
  Future<Either<Failure,List<CourseUnit>>> getCourseUnit();
}