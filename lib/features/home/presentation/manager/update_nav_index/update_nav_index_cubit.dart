
import '../../../../../core/helpers/common_imports.dart';

part 'update_nav_index_state.dart';

class UpdateNavIndexCubit extends Cubit<UpdateNavIndexState> {
  UpdateNavIndexCubit() : super(UpdateNavIndexInitial());
  void updateIndex(int index) {
    emit(UpdateIndex(index));
  }
}
