import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/change_pass_entity.dart';
import '../entities/user_info_entity.dart';

abstract class ProfileRepository {
  Future<Either<AppException, UserInfoEntity>> getUserInfo();

  Future<Either<AppException, UserInfoEntity>> updateUserInfo(
      Map<String, dynamic> params);

  Future<Either<AppException, ChangePassEntity>> changePassword(
      Map<String, dynamic> params);
}
