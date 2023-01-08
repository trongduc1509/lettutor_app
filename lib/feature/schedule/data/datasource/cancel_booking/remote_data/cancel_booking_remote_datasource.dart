import '../../../../../../base/define/apigateway/api_gateway.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../authentication/data/datasource/token/local_data/token_local_datasource.dart';
import 'model/cancel_booking_model.dart';
import 'resource/cancel_booking_resource.dart';

class CancelBookingRemoteDatasource {
  CancelBookingRemoteDatasource();

  final ApiGateway _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    getIt.get<TokenLocalDatasource>(),
    apiType: ApiType.user,
  );

  Future<CancelBookingModel> cancelBookedClass(
      Map<String, dynamic> json) async {
    var response = await _apiGateway.execute(
      resource: const CancelBookingResource(),
      method: HTTPMethod.delete,
      data: json,
    );
    return CancelBookingModel.fromJson(response.data);
  }
}
