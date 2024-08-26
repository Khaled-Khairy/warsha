import 'package:dio/dio.dart';
import 'package:warsha/core/networking/api_endpoints.dart';
import 'package:warsha/core/networking/dio_factory.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    DioFactory.configureDio(dio);
  }

  Future<Map<String, dynamic>> post({required String endPoint, required Map<String, dynamic> data,}) async {
    var response = await dio.post(
      "${ApiEndpoints.baseUrl}$endPoint",
      data: data,
    );

    return response.data;
  }
}
