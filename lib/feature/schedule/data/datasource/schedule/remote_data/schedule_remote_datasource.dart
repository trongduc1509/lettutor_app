import 'package:lettutor_app/feature/schedule/data/datasource/schedule/remote_data/models/schedule_model.dart';

import '../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'resource/schedule_resource.dart';

class ScheduleRemoteDatasource {
  ScheduleRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<ScheduleResponseModel> getBookedClasses(
      Map<String, dynamic> params) async {
    var response = await apiGateway.execute(
      resource: const ScheduleResource(),
      method: HTTPMethod.get,
      params: params,
    );
    return ScheduleResponseModel.fromJson(response.data);
  }
}
