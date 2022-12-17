import 'package:lettutor_app/base/define/apigateway/api_gateway.dart';
import 'package:lettutor_app/config/app_config.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'package:lettutor_app/feature/courses/detail/data/datasources/course_detail/remote_data/models/course_detail_model.dart';
import 'package:lettutor_app/feature/courses/detail/data/datasources/course_detail/remote_data/resource/course_detail_resource.dart';

import '../../../../../../../di/di_module.dart';

class CourseDetailRemoteDatasource {
  CourseDetailRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<CourseDetailResponseModel> getCourseDetail(String courseId) async {
    var response = await apiGateway.execute(
      resource: CourseDetailResource(courseId),
      method: HTTPMethod.get,
    );
    return CourseDetailResponseModel.fromJson(response.data);
  }
}
