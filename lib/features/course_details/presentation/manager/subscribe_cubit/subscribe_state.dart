part of 'subscribe_cubit.dart';

@immutable
sealed class SubscribeState {}

final class SubscribeInitial extends SubscribeState {}

final class SubscribeLoading extends SubscribeState {}

final class SubscribeSuccess extends SubscribeState {
  final SubscribeResponse subscribeResponse;

  SubscribeSuccess(this.subscribeResponse);
}

final class SubscribeFailure extends SubscribeState {
  final String errMessage;

  SubscribeFailure(this.errMessage);
}
