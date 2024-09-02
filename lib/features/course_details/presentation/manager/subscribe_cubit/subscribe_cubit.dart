import 'package:warsha/features/course_details/data/models/subscribe_request.dart';
import 'package:warsha/features/course_details/data/models/subscribe_response.dart';
import 'package:warsha/features/course_details/data/repo/subscribe_repo.dart';

import '../../../../../core/helpers/common_imports.dart';

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
