import '../utils/common_imports.dart';

class ApiService {
  final _baseUrl = "http://192.168.1.3:8000/api/";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    Options options = Options();

    if (token != null) {
      options.headers = {
        'Authorization': 'Bearer $token',
      };
    }

    var response = await _dio.post(
      "$_baseUrl$endPoint",
      data: data,
      options: options,
    );

    return response.data;
  }
}
