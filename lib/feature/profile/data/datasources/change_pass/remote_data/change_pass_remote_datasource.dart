import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'model/change_pass_model.dart';
import 'resource/change_pass_resource.dart';

class ChangePassRemoteDatasource {
  ChangePassRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<ChangePassBaseModel> changePassword(Map<String, dynamic> body) async {
    var response = await apiGateway.execute(
      resource: const ChangePassResource(),
      method: HTTPMethod.post,
      data: body,
    );
    return ChangePassBaseModel.fromJson(response.data);
  }
}
