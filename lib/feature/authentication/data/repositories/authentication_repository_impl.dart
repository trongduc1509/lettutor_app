import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasource/auth/remote_data/model/login.model.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either<AppException, LoginBaseModel>> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}
