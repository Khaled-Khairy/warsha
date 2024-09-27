import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CourseModel>>> getAllCourses();
  Future<Either<Failure,BuyNowResponse>> getCourseStatus({required String slug});

  Future<Either<Failure, BuyNowResponse>> buyCourse({required String slug,required BuyNowRequest buyNowRequest});
  Future<Either<Failure, String>> updateReceipt({required String slug,required BuyNowRequest buyNowRequest});
  Future<Either<Failure,List<CourseModel>>> checkSubscription();

}
