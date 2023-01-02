import 'package:lettutor_app/feature/profile/data/datasources/user_info/remote_data/model/user_info_model.dart';
import 'package:lettutor_app/feature/user/data/datasources/user/remote_data/resource/user_info_resource.dart';

import '../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import '../../../../../../di/di_module.dart';

class UserInfoRemoteDatasource {
  UserInfoRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<UserInfoBaseModel> getUserInformation() async {
    var response = await apiGateway.execute(
      resource: const UserInfoResource(),
      method: HTTPMethod.get,
    );
    return UserInfoBaseModel.fromJson(response.data);
  }

  Future<UserInfoBaseModel> updateUserInfo(Map<String, dynamic> body) async {
    var response = await apiGateway.execute(
      resource: const UserInfoResource(),
      method: HTTPMethod.put,
      data: body,
    );
    return UserInfoBaseModel.fromJson(response.data);
  }
}
