import 'package:warsha/core/helpers/common_imports.dart';

part 'category_courses_state.dart';

class CategoryCoursesCubit extends Cubit<CategoryCoursesState> {
  CategoryCoursesCubit(this.categoriesRepo) : super(CategoryCoursesInitial());
  final CategoriesRepo categoriesRepo;

  Future<void> getCategoryCourses({required String category}) async {
    emit(CategoryCoursesLoading());
    final response = await categoriesRepo.getCategoryCourses(category: category);
    response.fold(
      (failure) => emit(CategoryCoursesFailure(failure.errorMessage)),
      (courses) => emit(CategoryCoursesSuccess(courses)),
    );
  }
}
