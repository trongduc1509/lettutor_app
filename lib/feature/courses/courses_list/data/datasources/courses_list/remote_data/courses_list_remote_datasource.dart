import 'package:lettutor_app/feature/courses/courses_list/data/datasources/courses_list/remote_data/models/courses_list_model.dart';
import 'package:lettutor_app/feature/courses/courses_list/data/datasources/courses_list/remote_data/resource/courses_list_resource.dart';

import '../../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../../di/di_module.dart';
import '../../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';

class CoursesListRemoteDatasource {
  CoursesListRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<CoursesListResponseModel> getCoursesList(
      Map<String, dynamic> param, Map<String, dynamic> body) async {
    var response = await apiGateway.executeFetch(
      resource: const CoursesListResource(),
      method: HTTPMethod.get,
      params: param,
      data: body,
    );
    return CoursesListResponseModel.fromJson(response.data);
  }
}
