import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../di/di_module.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/user_info/remote_data/user_info_remote_datasource.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl();

  final UserInfoRemoteDatasource userInfoRemoteDatasource =
      getIt.get<UserInfoRemoteDatasource>();

  @override
  Future<Either<AppException, UserInfoEntity>> getUserInfo() async {
    try {
      final result = await userInfoRemoteDatasource.getUserInformation();
      return Right(result.user ?? const UserInfoEntity());
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
          displayMessage: 'Lỗi lấy thông tin user',
          displayTitle: 'Error while getting user information',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, UserInfoEntity>> updateUserInfo(
      Map<String, dynamic> params) async {
    try {
      final result = await userInfoRemoteDatasource.updateUserInfo(params);
      return Right(result.user ?? const UserInfoEntity());
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
          displayMessage: 'Lỗi cập nhật thông tin user',
          displayTitle: 'Error while updating user information',
        ),
      );
    }
  }
}
