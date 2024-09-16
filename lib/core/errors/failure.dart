import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Oops There was an Error, Please try again');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Oops There was an Error, Please try again');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Oops There was an Error, Please try again');
      case DioExceptionType.badCertificate:
        return ServerFailure('Oops There was an Error, Please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response);
      case DioExceptionType.cancel:
        return ServerFailure('The request was canceled. Please try again.');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Ops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(Response<dynamic>? response) {
    if (response != null && response.data is Map<String, dynamic>) {
      final errorResponse = ErrorResponse.fromJson(response.data);
      final errorMessage = errorResponse.getErrorMessages();
      return ServerFailure(errorMessage);
    }
    if (response?.statusCode == 400 ||
        response?.statusCode == 401 ||
        response?.statusCode == 403) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (response?.statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (response?.statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Ops There was an Error, Please try again');
    }
  }
}

class ErrorResponse {
  final Map<String, List<String>> errors;

  ErrorResponse({required this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    final errors = <String, List<String>>{};
    if (json.containsKey('errors')) {
      json['errors'].forEach((key, value) {
        errors[key] = List<String>.from(value);
      });
    }
    return ErrorResponse(errors: errors);
  }

  String getErrorMessages() {
    return errors.values.expand((messages) => messages).join(', ');
  }
}
