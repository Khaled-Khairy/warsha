import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:warsha/features/home/data/models/course_model.dart';
import 'package:warsha/features/home/data/repos/home_repos/home_repo.dart';

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
}
