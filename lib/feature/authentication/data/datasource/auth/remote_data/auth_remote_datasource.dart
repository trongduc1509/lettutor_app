import 'package:lettutor_app/base/define/apigateway/api_gateway.dart';
import 'package:lettutor_app/feature/authentication/data/datasource/auth/remote_data/model/login.model.dart';

class AuthenticationRemoteDatasource {
  const AuthenticationRemoteDatasource({
    required this.apiGateway,
  });

  final ApiGateway apiGateway;

  Future<LoginBaseModel> login() {}
}
