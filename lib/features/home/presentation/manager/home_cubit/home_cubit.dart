import 'package:warsha/core/helpers/common_imports.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getAllCourses() async {
    emit(HomeLoading());
    final response = await homeRepo.getAllCourses();
    response.fold(
      (failure) => emit(HomeFailure(failure.errorMessage)),
      (course) => emit(HomeSuccess(course)),
    );
  }

  Future<void> getCourseStatus({required String slug}) async {
    emit(CourseStatusLoading());
    final response = await homeRepo.getCourseStatus(slug: slug);
    response.fold(
      (failure) => emit(CourseStatusFailure(failure.errorMessage)),
      (subscriptionStatus) => emit(CourseStatusSuccess(subscriptionStatus)),
    );
  }
}
