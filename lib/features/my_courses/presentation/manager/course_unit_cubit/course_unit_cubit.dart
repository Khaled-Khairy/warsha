import '../../../../../core/helpers/common_imports.dart';

part 'course_unit_state.dart';

class CourseUnitCubit extends Cubit<CourseUnitState> {
  CourseUnitCubit(this.courseUnitRepoImpl) : super(CourseUnitInitial());
  final CourseUnitRepoImpl courseUnitRepoImpl;

  Future<void> getCourseUnit({required String slug}) async {
    emit(CourseUnitLoading());
    final response = await courseUnitRepoImpl.getCourseUnit(slug: slug);
    response.fold(
      (failure) => emit(CourseUnitFailure(failure.errorMessage)),
      (courseUnits) => emit(CourseUnitSuccess(courseUnits)),
    );
  }

  Future<void> getCourseStatus({required String slug}) async {
    emit(CourseStatusLoading());
    final response = await courseUnitRepoImpl.getSubscriptionStatus(slug: slug);
    response.fold(
      (failure) => emit(CourseStatusFailure(errMessage: failure.errorMessage)),
      (subscriptionStatus) {
        emit(CourseStatusSuccess(subscriptionStatus));
      },
    );
  }
}
