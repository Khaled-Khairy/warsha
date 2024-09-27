part of 'buy_now_cubit.dart';

@immutable
sealed class SubscribeState {}

final class BuyNowInitial extends SubscribeState {}

final class BuyNowLoading extends SubscribeState {}

final class BuyNowSuccess extends SubscribeState {
  final BuyNowResponse buyNowResponse;
  BuyNowSuccess(this.buyNowResponse);
}
final class UpdateReceiptSuccess extends SubscribeState {
final String message;

  UpdateReceiptSuccess(this.message);
}
final class BuyNowFailure extends SubscribeState {
  final String errMessage;

  BuyNowFailure(this.errMessage);
}
