import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';
import 'package:warsha/features/home/data/repos/buy_now_repo/buy_now_repo.dart';

class BuyNowRepoImpl extends BuyNowRepo {
  final ApiService apiService;

  BuyNowRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BuyNowResponse>> buyCourse({required String slug, required BuyNowRequest buyNowRequest}) async {
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
}
