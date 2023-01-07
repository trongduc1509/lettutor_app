import '../../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../../di/di_module.dart';
import '../../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'model/teacher_detail_model.dart';
import 'resource/teacher_detail_resource.dart';

class TeacherDetailRemoteDatasource {
  TeacherDetailRemoteDatasource();

  final ApiGateway _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<TeacherDetailBaseModel> getDetailTutor(String teacherId) async {
    final response = await _apiGateway.execute(
      resource: TeacherDetailResource(teacherId),
      method: HTTPMethod.get,
    );
    return TeacherDetailBaseModel.fromJson(response.data);
  }
}
