import 'dart:io';

import 'package:dio/dio.dart';

import '../common/response_error.dart';

class ApiException extends Error {
  ApiException(
    DioError? exception, {
    this.errorMessage = '',
    this.errorCode,
    this.statusCode = 0,
  }) {
    statusCode = exception?.response?.statusCode ?? statusCode;
    switch (exception?.type) {
      case DioErrorType.response:
        {
          try {
            final data = exception?.response?.data as Map?;
            dynamic errorBody = data?['error'] ?? '';
            // try to parse to response error
            final responseError = ResponseError.fromJson(errorBody);
            errorMessage = responseError.message ?? '';
            errorCode = responseError.statusCode.toString();
            statusCode = responseError.statusCode ?? 0;
          } catch (e) {
            errorMessage = e.toString();

            // Try to get Dio internal error
            // which might due to service not available
            if (exception?.error != null) {
              errorMessage = exception?.error?.toString() ?? '';
            }

            if (exception?.response?.statusMessage != null &&
                exception?.response?.statusMessage?.isNotEmpty == true) {
              errorMessage = exception?.response?.statusMessage ?? '';
            }
          }
        }
        break;
      default:
        {
          switch (exception?.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              {
                errorMessage = 'Connection timeout';
              }
              break;
            default:
              {
                if (exception?.error is SocketException) {
                  errorMessage = 'Connection problem';
                } else if (exception?.error is HttpException) {
                  errorMessage = 'Connection problem';
                }
              }
          }
        }
    }
  }

  factory ApiException.fromMessage(String errorMessage, String? errorCode,
          {int? statusCode, DioError? exception}) =>
      ApiException(
        exception,
        errorMessage: errorMessage,
        errorCode: errorCode,
        statusCode: statusCode ?? 0,
      );

  String? errorCode;
  int statusCode;
  String errorMessage = '';

  @override
  String toString() {
    return errorMessage;
  }
}
