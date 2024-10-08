part of 'course_unit_cubit.dart';

@immutable
sealed class CourseUnitState {}

final class CourseUnitInitial extends CourseUnitState {}

final class CourseUnitLoading extends CourseUnitState {}

final class CourseUnitSuccess extends CourseUnitState {
  final List<CourseUnit> courseUnit;

  CourseUnitSuccess(this.courseUnit);
}

final class CourseUnitFailure extends CourseUnitState {
  final String errMessage;

  CourseUnitFailure(this.errMessage);
}
final class CourseStatusLoading extends CourseUnitState {}
final class CourseStatusSuccess extends CourseUnitState {
  final BuyNowResponse subscriptionStatus;
  CourseStatusSuccess(this.subscriptionStatus);
}
final class CourseStatusFailure extends CourseUnitState {
  final String errMessage;

  CourseStatusFailure(this.errMessage);


}
