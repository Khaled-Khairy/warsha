import 'package:warsha/features/my_courses/data/models/course_unit_model.dart';

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
}
