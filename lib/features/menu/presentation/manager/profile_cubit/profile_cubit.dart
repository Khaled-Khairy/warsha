import 'package:warsha/features/menu/data/models/profile.dart';
import 'package:warsha/features/menu/data/repos/menu_repo.dart';

import '../../../../../core/helpers/common_imports.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.menuRepo) : super(ProfileInitial());
  final MenuRepo menuRepo;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final response = await menuRepo.getProfile();
    response.fold(
      (failure) => emit(ProfileFailure(failure.errorMessage)),
      (profile) => emit(ProfileSuccess(profile)),
    );
  }
}
