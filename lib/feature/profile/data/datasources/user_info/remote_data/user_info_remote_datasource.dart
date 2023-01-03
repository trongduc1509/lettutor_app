import '../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import '../../../../../user/data/datasources/user/remote_data/resource/user_info_resource.dart';
import 'model/user_info_model.dart';

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
