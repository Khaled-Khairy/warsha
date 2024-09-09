import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/data/repos/buy_now_repo/buy_now_repo.dart';

part 'buy_now_state.dart';

class BuyNowCubit extends Cubit<SubscribeState> {
  BuyNowCubit(this.buyNowRepo) : super(BuyNowInitial());
  final BuyNowRepo buyNowRepo;

  Future<void> buyCourse(
      {required String slug, required BuyNowRequest buyNowRequest}) async {
    emit(BuyNowLoading());
    final response = await buyNowRepo.buyCourse(
      slug: slug,
      buyNowRequest: buyNowRequest,
    );
    response.fold(
      (failure) => emit(BuyNowFailure(failure.errorMessage)),
      (buyNowResponse) => emit(BuyNowSuccess(buyNowResponse)),
    );
  }
}
