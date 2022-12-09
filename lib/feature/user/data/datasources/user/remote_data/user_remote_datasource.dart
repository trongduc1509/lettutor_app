import 'package:lettutor_app/base/define/apigateway/api_gateway.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';

import '../../../../../../config/app_config.dart';
import '../../../../../../di/di_module.dart';
import '../../../../domain/repositories/user_repository.dart';
import 'model/user.model.dart';
import 'resource/user_info_resource.dart';

class UserRemoteDatasource {
  UserRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<AuthenticationRepository>(),
    getIt.get<UserRepository>(),
    apiType: ApiType.user,
  );

  Future<UserBaseModel> getUserInformation() async {
    final response = await apiGateway.execute(
      resource: const UserInfoResource(),
      method: HTTPMethod.get,
    );
    return UserBaseModel.fromJson(response.data);
  }
}
