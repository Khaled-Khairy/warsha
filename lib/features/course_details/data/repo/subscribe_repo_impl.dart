import 'package:dartz/dartz.dart';
import 'package:warsha/core/helpers/common_imports.dart';


class SubscribeRepoImpl extends SubscribeRepo {
  final ApiService apiService;

  SubscribeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SubscribeResponse>> subscribeCourse(
      {required String slug,
      required SubscribeRequest subscribeRequest}) async {
    try {
      final response = await apiService.postWithFormData(
        endPoint: ApiEndpoints.subscribeToCourse(slug),
        formData: await subscribeRequest.toFormData(),
      );
      final subscribeResponse = SubscribeResponse.fromJson(response);
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
