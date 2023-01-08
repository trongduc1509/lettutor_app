import '../../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../../di/di_module.dart';
import '../../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'model/book_class_model.dart';
import 'resource/book_class_resource.dart';

class BookClassRemoteDatasource {
  BookClassRemoteDatasource();

  final ApiGateway _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<BookClassModel> bookClass(Map<String, dynamic> json) async {
    var response = await _apiGateway.execute(
      resource: const BookClassResource(),
      method: HTTPMethod.post,
      data: json,
    );
    return BookClassModel.fromJson(response.data);
  }
}
