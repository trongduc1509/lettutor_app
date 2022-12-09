import 'package:lettutor_app/feature/user/data/datasources/user/remote_data/user_remote_datasource.dart';
import 'package:lettutor_app/feature/user/domain/entities/user_entity.dart';

import 'package:lettutor_app/feature/authentication/domain/enities/token_entity.dart';

import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';

import 'package:dartz/dartz.dart';

import '../../../../di/di_module.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl();

  final UserRemoteDatasource userRemoteDatasource =
      getIt.get<UserRemoteDatasource>();

  @override
  Future<Either<AppException, UserEntity>> getUserInformation() async {
    try {
      final result = await userRemoteDatasource.getUserInformation();
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Lỗi lấy thông tin user',
        displayTitle: 'Error while getting user information',
      ));
    }
  }
}
