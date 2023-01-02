import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/user_info_entity.dart';

abstract class ProfileRepository {
  Future<Either<AppException, UserInfoEntity>> getUserInfo();

  Future<Either<AppException, UserInfoEntity>> updateUserInfo(
      Map<String, dynamic> params);
}
