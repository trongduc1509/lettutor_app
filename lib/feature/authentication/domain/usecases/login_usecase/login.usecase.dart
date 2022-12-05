import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../enities/login_entity.dart';
import 'login_params.usecase.dart';
import '../../../../../base/define/usecase/usecase.base.dart';

class LoginUseCase
    with UseCase<LoginUseCaseParams, Either<AppException, LoginEntity>> {
  @override
  Future<Either<AppException, LoginEntity>> execute(LoginUseCaseParams params) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
