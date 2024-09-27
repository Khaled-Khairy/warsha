part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<CourseModel> courses;

  HomeSuccess(this.courses);
}

final class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure(this.errMessage);
}

final class CourseStatusLoading extends HomeState {}

final class CourseStatusSuccess extends HomeState {
  final BuyNowResponse courseStatus;

  CourseStatusSuccess(this.courseStatus);
}

final class CourseStatusFailure extends HomeState {
  final String errMessage;

  CourseStatusFailure(this.errMessage);
}

final class MyCoursesLoading extends HomeState {}

final class MyCoursesSuccess extends HomeState {
  final List<CourseModel> subscribedCourses;

  MyCoursesSuccess(this.subscribedCourses);
}

final class MyCoursesFailure extends HomeState {
  final String errMessage;

  MyCoursesFailure(this.errMessage);
}
