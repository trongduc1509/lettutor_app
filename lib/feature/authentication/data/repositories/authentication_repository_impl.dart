import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/login_entity.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/register_with_email_pass_usecase/register_email_pass_params.usecase.dart';

import '../../../../di/di_module.dart';
import '../../domain/enities/token_entity.dart';
import '../../domain/usecases/refresh_token_usecase/refresh_token_params.usecase.dart';
import '../datasource/auth/remote_data/auth_remote_datasource.dart';
import '../../domain/usecases/login_with_password_usecase/login_with_password_params.usecase.dart';
import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasource/auth/remote_data/model/login.model.dart';
import '../datasource/token/local_data/token_local_datasource.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl();

  final AuthenticationRemoteDatasource authRemoteDatasource =
      getIt.get<AuthenticationRemoteDatasource>();
  final TokenLocalDatasource tokenLocalDatasource =
      getIt.get<TokenLocalDatasource>();

  @override
  Future<Either<AppException, LoginEntity>> refreshToken(
      RefreshTokenUseCaseParams params) async {
    try {
      var result = await authRemoteDatasource.refreshToken(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
          displayMessage: 'Lỗi refresh token',
          displayTitle: 'Error while refreshing token',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, LoginBaseModel>> loginWithPassword(
      LoginWithPasswordUseCaseParams params) async {
    try {
      var result = await authRemoteDatasource.loginWithPassword(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
          displayMessage: 'Lỗi đăng nhập với email & mật khẩu',
          displayTitle: 'Error while login with email & password',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, LoginEntity>> registerEmailPassword(
      RegisterEmailPassUseCaseParams params) async {
    try {
      var result = await authRemoteDatasource.registerWithEmailPassword(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
          displayMessage: 'Lỗi đăng ký với email & mật khẩu',
          displayTitle: 'Error while register with email & password',
        ),
      );
    }
  }

  @override
  Future<TokenEntity?> activateSavedToken() =>
      tokenLocalDatasource.activateSavedToken();

  @override
  Future<void> clearUserData() => tokenLocalDatasource.clearTokenLocalData();

  @override
  TokenEntity? getAccessToken() => tokenLocalDatasource.getAccessToken();

  @override
  TokenEntity? getRefreshToken() => tokenLocalDatasource.getRefreshToken();

  @override
  Future<void> saveSession(
          {required TokenEntity accessToken,
          required TokenEntity refreshToken}) =>
      tokenLocalDatasource.saveSession(accessToken, refreshToken);
}
