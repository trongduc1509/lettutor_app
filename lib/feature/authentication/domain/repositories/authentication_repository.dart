import 'package:dartz/dartz.dart';
import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../../data/datasource/login/remote_data/model/login.model.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, LoginBaseModel>> refreshToken();
}
