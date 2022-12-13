import 'package:lettutor_app/base/define/apigateway/api_gateway.dart';
import 'package:lettutor_app/config/app_config.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/data/datasources/teacher_list/remote_data/resource/teacher_list_resource.dart';

import '../../../../../../../di/di_module.dart';
import 'model/teacher_list_model.dart';

class TeacherListRemoteDatasource {
  TeacherListRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<TeacherTotalListBaseModel> getTeacherList(
      Map<String, dynamic> params, Map<String, dynamic> body) async {
    var response = await apiGateway.executeFetch(
      resource: const TeacherListResource(),
      method: HTTPMethod.get,
      params: params,
      data: body,
    );
    return TeacherTotalListBaseModel.fromJson(response.data);
  }
}
