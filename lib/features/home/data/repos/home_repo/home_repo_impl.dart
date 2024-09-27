import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    try {
      final response = await apiService.get(endPoint: ApiEndpoints.allCourses);
      final List<CourseModel> courses = [];

      for (var item in response) {
        courses.add(CourseModel.fromJson(item));
      }
      return Right(courses);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BuyNowResponse>> buyCourse(
      {required String slug, required BuyNowRequest buyNowRequest}) async {
    try {
      final response = await apiService.postWithFormData(
        endPoint: ApiEndpoints.subscribeToCourse(slug),
        formData: await buyNowRequest.toFormData(),
      );
      final subscribeResponse = BuyNowResponse.fromJson(response);
      return right(subscribeResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BuyNowResponse>> getCourseStatus(
      {required String slug}) async {
    try {
      final response = await apiService.get(
          endPoint: ApiEndpoints.getSubscriptionStatus(slug));
      final BuyNowResponse subscriptionStatus =
          BuyNowResponse.fromJson(response[0]);
      return right(subscriptionStatus);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, BuyNowResponse>> updateReceipt(
      {required String slug, required BuyNowRequest buyNowRequest}) async {
    try {
      final response = await apiService.putWithFormData(
        endPoint: ApiEndpoints.subscribeToCourse(slug),
        formData: await buyNowRequest.toFormData(),
      );
      final subscribeResponse = BuyNowResponse.fromJson(response);
      return right(subscribeResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, List<CourseModel>>> checkSubscription() async {
    try {
      final response = await apiService.get(endPoint: ApiEndpoints.myCourses);
      List<CourseModel> courses = [];
      for (var item in response) {
        courses.add(CourseModel.fromJson(item));
      }
      return Right(courses);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
