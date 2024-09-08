part of 'category_courses_cubit.dart';

@immutable
sealed class CategoryCoursesState {}

final class CategoryCoursesInitial extends CategoryCoursesState {}

final class CategoryCoursesLoading extends CategoryCoursesState {}

final class CategoryCoursesSuccess extends CategoryCoursesState {
  final List<CourseModel> courses;

  CategoryCoursesSuccess(this.courses);
}

final class CategoryCoursesFailure extends CategoryCoursesState {
  final String errMessage;

  CategoryCoursesFailure(this.errMessage);
}
