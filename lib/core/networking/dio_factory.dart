import 'package:warsha/core/helpers/common_imports.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.receiveTimeout = timeOut
        ..options.connectTimeout = timeOut;
      addDioHeaders();
      addDioInterceptors();
    }
    return dio!;
  }

  static void addDioHeaders() async {
    final String? token = await SharedPrefHelper.getString(
        key: SharedPrefKeys.accessToken);

    if (token != null && token.isNotEmpty) {
      dio?.options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      dio?.options.headers = {
        'Accept': 'application/json',
      };
    }
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}
