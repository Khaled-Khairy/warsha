import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static void configureDio(Dio dio) {
    const Duration timeOut = Duration(seconds: 30);

    dio
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;

    if (!dio.interceptors.any((i) => i is PrettyDioLogger)) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
  }
}
