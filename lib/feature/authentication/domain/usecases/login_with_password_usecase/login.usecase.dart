import 'package:dartz/dartz.dart';
import '../../repositories/authentication_repository.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../enities/login_entity.dart';
import 'login_with_password_params.usecase.dart';
import '../../../../../base/define/usecase/usecase.base.dart';

class LoginUseCase
    with
        UseCase<LoginWithPasswordUseCaseParams,
            Either<AppException, LoginEntity>> {
  const LoginUseCase({
    required this.authRepo,
  });

  final AuthenticationRepository authRepo;

  @override
  Future<Either<AppException, LoginEntity>> execute(
          LoginWithPasswordUseCaseParams params) =>
      authRepo.loginWithPassword(params);
}
