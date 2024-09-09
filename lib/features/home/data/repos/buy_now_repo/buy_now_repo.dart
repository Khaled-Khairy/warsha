import 'package:dartz/dartz.dart';
import 'package:warsha/core/errors/failure.dart';
import 'package:warsha/features/home/data/models/buy_now/buy_now_request.dart';
import 'package:warsha/features/home/data/models/buy_now/buy_now_response.dart';

abstract class BuyNowRepo {
  Future<Either<Failure, BuyNowResponse>> buyCourse(
      {required String slug,required BuyNowRequest buyNowRequest});
}
