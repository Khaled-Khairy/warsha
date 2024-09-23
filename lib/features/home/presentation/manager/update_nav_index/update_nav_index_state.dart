part of 'update_nav_index_cubit.dart';

@immutable
sealed class UpdateNavIndexState {}

final class UpdateNavIndexInitial extends UpdateNavIndexState {}
final class UpdateIndex extends UpdateNavIndexState{
  final int index;
  UpdateIndex(this.index);
}