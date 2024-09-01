part of 'category_list_cubit.dart';

@immutable
sealed class CategoryListState {}

final class CategoryListInitial extends CategoryListState {}

final class CategoryListLoading extends CategoryListState {}

final class CategoryListSuccess extends CategoryListState {
  final List<CourseModel> courses;

  CategoryListSuccess(this.courses);
}

final class CategoryListFailure extends CategoryListState {
  final String errMessage;

  CategoryListFailure(this.errMessage);
}
