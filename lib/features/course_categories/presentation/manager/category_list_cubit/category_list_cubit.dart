import 'package:warsha/core/helpers/common_imports.dart';

part 'category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  CategoryListCubit(this.categoriesRepo) : super(CategoryListInitial());
  final CategoriesRepo categoriesRepo;

  Future<void> getCategoryCourses({required String category}) async {
    print("==========================");
    emit(CategoryListLoading());
    final response = await categoriesRepo.getCategoryCourses(category: category);
    response.fold(
      (failure) => emit(CategoryListFailure(failure.errorMessage)),
      (courses) => emit(CategoryListSuccess(courses)),
    );
  }
}
