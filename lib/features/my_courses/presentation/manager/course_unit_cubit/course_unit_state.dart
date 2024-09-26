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
final class SubscriptionStateLoading extends CourseUnitState {}
final class SubscriptionStateSuccess extends CourseUnitState {
  final BuyNowResponse subscriptionStatus;
  SubscriptionStateSuccess(this.subscriptionStatus);
}
final class SubscriptionStateFailure extends CourseUnitState {
  final String errMessage;

  SubscriptionStateFailure({required this.errMessage});

}
