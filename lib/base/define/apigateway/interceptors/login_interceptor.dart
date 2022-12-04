import 'package:dio/dio.dart';

import '../../../util/log.dart';
import '../exception/network_error_code.dart';
import '../exception/network_exception.dart';

class LoginInterceptor extends QueuedInterceptor {
  LoginInterceptor({this.tenant});

  final String? tenant;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    AppLog.log('API ${options.method} => ${options.baseUrl}${options.path}',
        name: 'LoginInterceptor');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 400 && err.response?.data != null) {
      handler.resolve(err.response!);
    } else if (err.response?.statusCode != null) {
      var message = 'Lỗi đăng nhập';
      switch (err.response?.statusCode) {
        case 400:
          message += ': Bad Request';
          break;
        case 401:
          message += ': Xác thực lỗi';
          break;
        case 403:
          message += ': Forbidden';
          break;
        case 404:
          message += ': Không tìm thấy API';
          break;
        case 405:
          message += ': Quyền bị từ chối';
          break;
        case 408:
          message += ': Server Timeout';
          break;
        case 500:
          message += ': Server lỗi';
          break;
        case 501:
          message += ': Gateway lỗi';
          break;
        default:
          message += ': StatusCode';
      }
      handler.next(DioError(
          requestOptions: err.requestOptions,
          error: NetworkException(
            error: err,
            displayMessage: message,
            displayTitle: 'Lỗi đăng nhập',
            errorCode: err.response?.statusCode.toString() ??
                NetworkErrorCode.dioErrorUndefined,
            url: '${err.requestOptions.baseUrl}${err.requestOptions.path}',
          ),
          type: err.type,
          response: err.response));
    } else {
      handler.next(DioError(
          requestOptions: err.requestOptions,
          error: NetworkException(
              errorCode: NetworkErrorCode.dioErrorUndefined,
              displayTitle: 'Lỗi đăng nhập',
              displayMessage: 'Kết nối lỗi, vui lòng kiểm tra mạng và thử lại.',
              error: err,
              url: '${err.requestOptions.baseUrl}${err.requestOptions.path}'),
          type: err.type,
          response: err.response));
    }
  }
}
