import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/forgot_pass_entity.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/forgot_password_usecase/forgot_password_params.usecase.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../enities/login_entity.dart';
import '../enities/token_entity.dart';
import '../usecases/login_with_password_usecase/login_with_password_params.usecase.dart';
import '../usecases/refresh_token_usecase/refresh_token_params.usecase.dart';
import '../usecases/register_with_email_pass_usecase/register_email_pass_params.usecase.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, LoginEntity>> refreshToken(
      RefreshTokenUseCaseParams params);

  Future<Either<AppException, LoginEntity>> loginWithPassword(
      LoginWithPasswordUseCaseParams params);

  Future<Either<AppException, LoginEntity>> registerEmailPassword(
      RegisterEmailPassUseCaseParams params);

  Future<Either<AppException, ForgotPassEntity>> forgotPassword(
      ForgotPassUseCaseParams params);

  TokenEntity? getAccessToken();
  TokenEntity? getRefreshToken();
  Future<void> saveSession(
      {required TokenEntity accessToken, required TokenEntity refreshToken});
  Future<TokenEntity?> activateSavedToken();
  Future<void> clearUserData();
}
