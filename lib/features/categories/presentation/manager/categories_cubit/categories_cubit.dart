import 'package:warsha/core/helpers/common_imports.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;

  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final response = await categoriesRepo.getCategories();
    response.fold(
      (failure) => emit(CategoriesFailure(failure.errorMessage)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
