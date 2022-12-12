import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/auth/remote_data/model/forgot_password.model.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/auth/remote_data/resource/forgot_password_resource.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/auth/remote_data/resource/register_resource.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/forgot_password_usecase/forgot_password_params.usecase.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/register_with_email_pass_usecase/register_email_pass_params.usecase.dart';

import '../../token/local_data/token_local_datasource.dart';
import '../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../../di/di_module.dart';
import '../../../../domain/usecases/login_with_password_usecase/login_with_password_params.usecase.dart';
import '../../../../domain/usecases/refresh_token_usecase/refresh_token_params.usecase.dart';
import 'model/login.model.dart';
import 'model/register.model.dart';
import 'resource/login_resource.dart';
import 'resource/refresh_token_resource.dart';

class AuthenticationRemoteDatasource {
  AuthenticationRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.public,
  );

  Future<LoginBaseModel> loginWithPassword(
      LoginWithPasswordUseCaseParams params) async {
    var response = await apiGateway.execute(
      resource: const LoginResource(),
      method: HTTPMethod.post,
      data: params.toJson(),
    );
    return LoginBaseModel.fromJson(response.data);
  }

  Future<LoginBaseModel> refreshToken(RefreshTokenUseCaseParams params) async {
    var response = await apiGateway.execute(
      resource: const RefreshTokenResource(),
      method: HTTPMethod.post,
      data: params.toJson(),
    );
    return LoginBaseModel.fromJson(response.data);
  }

  Future<RegisterBaseModel> registerWithEmailPassword(
      RegisterEmailPassUseCaseParams params) async {
    var response = await apiGateway.execute(
      resource: const RegisterResource(),
      method: HTTPMethod.post,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: params.toJson(),
    );
    return RegisterBaseModel.fromJson(response.data);
  }

  Future<ForgotPassBaseModel> forgotPassword(
      ForgotPassUseCaseParams params) async {
    var response = await apiGateway.execute(
      resource: const ForgotPassResource(),
      method: HTTPMethod.post,
      data: params.toJson(),
    );
    return ForgotPassBaseModel.fromJson(response.data);
  }
}
