import 'package:lettutor_app/base/define/interface/auth_interface/authentication.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';

import '../../../../../user/domain/repositories/user_repository.dart';
import '../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../../di/di_module.dart';
import '../../../../domain/usecases/login_with_password_usecase/login_with_password_params.usecase.dart';
import '../../../../domain/usecases/refresh_token_usecase/refresh_token_params.usecase.dart';
import 'model/login.model.dart';
import 'resource/login_resource.dart';
import 'resource/refresh_token_resource.dart';

class AuthenticationRemoteDatasource {
  AuthenticationRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<AuthenticationRepository>(),
    getIt.get<UserRepository>(),
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
}
