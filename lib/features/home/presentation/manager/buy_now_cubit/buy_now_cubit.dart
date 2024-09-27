import 'package:warsha/core/helpers/common_imports.dart';

part 'buy_now_state.dart';

class BuyNowCubit extends Cubit<SubscribeState> {
  BuyNowCubit(this.homeRepo) : super(BuyNowInitial());
  final HomeRepo homeRepo;

  Future<void> buyCourse(
      {required String slug, required BuyNowRequest buyNowRequest}) async {
    emit(BuyNowLoading());
    final response = await homeRepo.buyCourse(
      slug: slug,
      buyNowRequest: buyNowRequest,
    );
    response.fold(
      (failure) => emit(BuyNowFailure(failure.errorMessage)),
      (buyNowResponse) => emit(BuyNowSuccess(buyNowResponse)),
    );
  }

  Future<void> updateReceipt({required String slug, required BuyNowRequest buyNowRequest}) async {
    emit(BuyNowLoading());
    final response = await homeRepo.updateReceipt(
      slug: slug,
      buyNowRequest: buyNowRequest,
    );
    response.fold(
      (failure) => emit(BuyNowFailure(failure.errorMessage)),
      (message) => emit(UpdateReceiptSuccess(message)),
    );
  }
}
