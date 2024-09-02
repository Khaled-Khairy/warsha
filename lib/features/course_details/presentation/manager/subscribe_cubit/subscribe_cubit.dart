


import 'package:warsha/core/helpers/common_imports.dart';

part 'subscribe_state.dart';

class SubscribeCubit extends Cubit<SubscribeState> {
  SubscribeCubit(this.subscribeRepo) : super(SubscribeInitial());
  final SubscribeRepo subscribeRepo;

  Future<void> subscribeToCourse(
      {required String slug, required SubscribeRequest subscribeRequest}) async {
    emit(SubscribeLoading());
    final response = await subscribeRepo.subscribeCourse(
      slug: slug,
      subscribeRequest: subscribeRequest,
    );
    response.fold(
      (failure) => emit(SubscribeFailure(failure.errorMessage)),
      (subscribeResponse) => emit(SubscribeSuccess(subscribeResponse)),
    );
  }
}
