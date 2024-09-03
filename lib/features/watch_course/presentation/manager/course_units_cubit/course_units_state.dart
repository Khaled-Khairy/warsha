part of 'course_units_cubit.dart';

@immutable
sealed class CourseUnitsState {}

final class CourseUnitsInitial extends CourseUnitsState {}

final class CourseUnitsLoading extends CourseUnitsState {}

final class CourseUnitsSuccess extends CourseUnitsState {
  final List<CourseUnit> courseUnits;

  CourseUnitsSuccess(this.courseUnits);
}

final class CourseUnitsFailure extends CourseUnitsState {
  final String errMessage;

  CourseUnitsFailure(this.errMessage);
}
