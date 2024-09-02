import 'package:dartz/dartz.dart';
import 'package:warsha/core/errors/failure.dart';
import 'package:warsha/features/course_details/data/models/subscribe_request.dart';
import 'package:warsha/features/course_details/data/models/subscribe_response.dart';

abstract class SubscribeRepo {
  Future<Either<Failure, SubscribeResponse>> subscribeCourse(
      {required String slug,required SubscribeRequest subscribeRequest});
}
