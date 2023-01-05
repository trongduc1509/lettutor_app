import '../../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../../di/di_module.dart';
import '../../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'models/courses_list_model.dart';
import 'resource/courses_list_resource.dart';

class CoursesListRemoteDatasource {
  CoursesListRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<CoursesListResponseModel> getCoursesList(
      Map<String, dynamic> param) async {
    var response = await apiGateway.execute(
      resource: const CoursesListResource(),
      method: HTTPMethod.get,
      params: param,
    );
    return CoursesListResponseModel.fromJson(response.data);
  }
}
