import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../enities/login_entity.dart';
import '../enities/token_entity.dart';
import '../usecases/login_with_password_usecase/login_with_password_params.usecase.dart';
import '../usecases/refresh_token_usecase/refresh_token_params.usecase.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, LoginEntity>> refreshToken(
      RefreshTokenUseCaseParams params);

  Future<Either<AppException, LoginEntity>> loginWithPassword(
      LoginWithPasswordUseCaseParams params);

  TokenEntity? getAccessToken();
  TokenEntity? getRefreshToken();
  Future<void> saveSession(
      {required TokenEntity accessToken, required TokenEntity refreshToken});
  Future<TokenEntity?> activateSavedToken();
  Future<void> clearUserData();
}
