import 'package:warsha/features/watch_course/data/models/course_unit_model.dart';
import 'package:warsha/features/watch_course/data/repos/course_unit_repo_impl.dart';

import '../../../../../core/helpers/common_imports.dart';

part 'course_units_state.dart';

class CourseUnitsCubit extends Cubit<CourseUnitsState> {
  CourseUnitsCubit(this.courseUnitRepoImpl) : super(CourseUnitsInitial());
  final CourseUnitRepoImpl courseUnitRepoImpl;
  final List<CourseUnit> courseUnits = [];

  Future getCourseUnits() async {
    emit(CourseUnitsLoading());
    final response = await courseUnitRepoImpl.getCourseUnit();
    response.fold(
      (failure) => emit(CourseUnitsFailure(failure.errorMessage)),
      (courseUnits) {
        this.courseUnits.addAll(courseUnits);
        emit(
          CourseUnitsSuccess(courseUnits),
        );
      },
    );
  }
}
