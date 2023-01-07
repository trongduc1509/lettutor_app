import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lettutor_app/config/app_config.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/auth/remote_data/model/login.model.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/token_entity.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/refresh_token_usecase/refresh_token_params.usecase.dart';

import '../../../../feature/authentication/data/datasource/auth/remote_data/resource/refresh_token_resource.dart';
import '../../../../shared/managers/app_manager.dart';
import '../../../../shared/managers/events_manager.dart';

// enum RefreshTokenState { idle, refreshing }

// var _refreshTokenState = RefreshTokenState.idle;
// const maxWait = 30;
// var waitCount = 1;

// Future _waitForRefreshTokenStateChanged() async {
//   waitCount = 1;
//   while (true) {
//     if (_refreshTokenState == RefreshTokenState.idle || waitCount >= maxWait) {
//       break;
//     }
//     await Future.delayed(const Duration(seconds: 1));
//     log('wait count: $waitCount');
//     waitCount++;
//   }
// }

class RefreshTokenInterceptor extends QueuedInterceptor {
  RefreshTokenInterceptor(
    this._dio,
    this._tokenLocalDatasource,
    // this._authRepository,
  );

  // final AuthenticationRepository _authRepository;
  final TokenLocalDatasource _tokenLocalDatasource;
  final Dio _dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response == null) {
      handler.next(err);
      return;
    }

    if (err.response!.statusCode == 401 &&
        err.response!.requestOptions.path !=
            '/${const RefreshTokenResource().path}') {
      final refreshToken = _tokenLocalDatasource.getRefreshToken();
      if (refreshToken == null) {
        handler.next(err);
        return;
      }

      TokenEntity? newAccessToken;
      final options = err.response!.requestOptions;
      try {
        log('perform refresh token');
        //_refreshTokenState = RefreshTokenState.refreshing;
        final refreshResponse =
            await Dio(BaseOptions(baseUrl: AppConfig.value.baseUrl, headers: {
          'Content-Type': 'application/json',
        })).post(
          const RefreshTokenResource().path,
          data: RefreshTokenUseCaseParams(
            refreshToken: refreshToken.tokenDetail,
          ).toJson(),
        );

        final loginResponse = LoginBaseModel.fromJson(
            refreshResponse.data as Map<String, dynamic>);
        newAccessToken = loginResponse.accessToken;
        await _tokenLocalDatasource.saveSession(
            newAccessToken ?? const TokenEntity(), refreshToken);

        final retryHeaders = err.requestOptions.headers;
        retryHeaders['Authorization'] = 'Bearer ${newAccessToken?.tokenDetail}';
        final RequestOptions newReqOpt = options.copyWith(
          headers: retryHeaders,
        );
        _dio.fetch(newReqOpt);
      } catch (e) {
        if (e is DioError &&
            (e.response!.statusCode == 401 || e.response!.statusCode == 400)) {
          EventsManager().sessionExpired.add(DateTime.now());
          AppManager.shared.appState.add(AppState.authenticated);
        }
        return handler.next(err);
      }
    }

    super.onError(err, handler);
  }
}
