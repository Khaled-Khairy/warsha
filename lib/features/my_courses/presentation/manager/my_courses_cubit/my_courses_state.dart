part of 'my_courses_cubit.dart';

@immutable
sealed class MyCoursesState {}

final class MyCoursesInitial extends MyCoursesState {}

final class MyCoursesLoading extends MyCoursesState {}

final class MyCoursesSuccess extends MyCoursesState {
  final List<CourseModel> courses;

  MyCoursesSuccess(this.courses);
}

final class MyCoursesFailure extends MyCoursesState {
  final String errMessage;

  MyCoursesFailure(this.errMessage);
}
