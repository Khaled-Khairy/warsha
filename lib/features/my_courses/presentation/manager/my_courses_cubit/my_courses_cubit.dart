import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/my_courses/data/repos/my_courses_repo/my_courses_repo.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit(this.myCoursesRepo) : super(MyCoursesInitial());
  final MyCoursesRepo myCoursesRepo;

  Future<void> getSubscribedCourses() async {
    emit(MyCoursesLoading());
    final result = await myCoursesRepo.getSubscribedCourses();
    result.fold(
      (failure) => emit(MyCoursesFailure(failure.errorMessage)),
      (courses  ) => emit(MyCoursesSuccess(courses)),
    );
  }
}
