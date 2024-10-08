import 'package:warsha/core/helpers/common_imports.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    if (_dio == null) {
      final dioInstance = Dio();
      const timeout = Duration(seconds: 30);

      dioInstance
        ..options.receiveTimeout = timeout
        ..options.connectTimeout = timeout
        ..options.sendTimeout = timeout;

      await _addDioHeaders(dioInstance);
      _addDioInterceptors(dioInstance);

      _dio = dioInstance;
    }
    return _dio!;
  }

  static Future<void> _addDioHeaders(Dio dio) async {
    try {
      final token = await SharedPrefHelper.getString(key: SharedPrefKeys.accessToken);

      dio.options.headers = {
        'Accept': 'application/json',
        if (token.isNotEmpty) 'Authorization': 'Bearer $token',
      };
    } catch (e) {
      dio.options.headers = {
        'Accept': 'application/json',
      };
    }
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void _addDioInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}
