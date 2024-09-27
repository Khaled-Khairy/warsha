import 'package:dio/dio.dart';
import 'package:warsha/core/networking/api_endpoints.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.post(
      ApiEndpoints.baseUrl + endPoint,
      data: data,
    );

    return response.data;
  }

  Future<Map<String, dynamic>> postWithFormData({
    required String endPoint,
    required FormData formData,
  }) async {
    var response = await dio.post(
      ApiEndpoints.baseUrl + endPoint,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> putWithFormData({
    required String endPoint,
    required FormData formData,
  }) async {
    var response = await dio.put(
      ApiEndpoints.baseUrl + endPoint,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    return response.data;
  }

  Future get({required String endPoint}) async {
    var response = await dio.get(ApiEndpoints.baseUrl + endPoint);
    return response.data;
  }
}
