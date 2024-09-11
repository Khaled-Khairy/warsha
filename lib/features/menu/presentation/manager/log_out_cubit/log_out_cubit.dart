import 'package:warsha/features/menu/data/repos/menu_repo.dart';

import '../../../../../core/helpers/common_imports.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this.menuRepo) : super(LogOutInitial());
  final MenuRepo menuRepo;

  Future<void> logOut() async {
    emit(LogOutLoading());
    final response = await menuRepo.logOut();
    response.fold(
      (failure) => emit(LogOutFailed(failure.errorMessage)),
      (message) => emit(LogOutSuccess(message)),
    );
  }
}
