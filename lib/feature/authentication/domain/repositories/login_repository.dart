import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../enities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<AppException, LoginEntity>> getLoginData();
}
