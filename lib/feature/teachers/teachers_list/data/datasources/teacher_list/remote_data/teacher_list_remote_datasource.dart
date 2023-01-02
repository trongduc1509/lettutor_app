import 'package:lettutor_app/feature/teachers/teachers_list/data/datasources/teacher_list/remote_data/resource/teacher_favorite_resource.dart';

import '../../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../../di/di_module.dart';
import '../../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'model/teacher_list_get_model.dart';
import 'model/teacher_list_model.dart';
import 'resource/teacher_list_resource.dart';
import 'resource/teacher_list_search_resource.dart';

class TeacherListRemoteDatasource {
  TeacherListRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<TeacherTotalListGetBaseModel> getTeacherList(
      Map<String, dynamic> params, Map<String, dynamic> body) async {
    var response = await apiGateway.executeFetch(
      resource: const TeacherListResource(),
      method: HTTPMethod.get,
      params: params,
      data: body,
    );
    return TeacherTotalListGetBaseModel.fromJson(response.data);
  }

  Future<TeacherTotalListBaseModel> searchTeacherList(
      Map<String, dynamic> body) async {
    var response = await apiGateway.execute(
      resource: const TeacherListSearchResource(),
      method: HTTPMethod.post,
      data: body,
    );
    return TeacherTotalListBaseModel.fromJson(response.data);
  }

  Future manageFavTeacher(Map<String, dynamic> body) async {
    await apiGateway.execute(
      resource: const ManageFavTeacherResource(),
      method: HTTPMethod.post,
      data: body,
    );
  }
}
