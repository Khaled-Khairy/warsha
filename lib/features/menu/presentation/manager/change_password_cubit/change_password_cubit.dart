
import 'package:warsha/features/menu/data/models/change_password/change_password_request.dart';
import 'package:warsha/features/menu/data/models/change_password/change_password_response.dart';
import 'package:warsha/features/menu/data/repos/menu_repo.dart';

import '../../../../../core/helpers/common_imports.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.menuRepo) : super(ChangePasswordInitial());
  final MenuRepo menuRepo;
  Future<void> changePassword({required ChangePasswordRequest changePasswordRequest}) async {
    emit(ChangePasswordLoading());
    final response = await menuRepo.changePassword(changePasswordRequest: changePasswordRequest);
    response.fold(
      (failure) => emit(ChangePasswordFailed(failure.errorMessage)),
      (changePasswordResponse) => emit(ChangePasswordSuccess(changePasswordResponse)),
    );
  }
}
