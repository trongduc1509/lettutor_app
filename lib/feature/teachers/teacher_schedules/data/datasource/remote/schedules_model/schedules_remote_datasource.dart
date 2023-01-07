import '../../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../../di/di_module.dart';
import '../../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'model/schedules_model.dart';
import 'resource/schedules_of_tutor_resource.dart';

class SchedulesRemoteDatasource {
  SchedulesRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<SchedulesTotalModel> getSchedulesByTutorId(
      Map<String, dynamic> params) async {
    var response = await apiGateway.execute(
      resource: const SchedulesOfTutorResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return SchedulesTotalModel.fromJson(response.data);
  }
}
