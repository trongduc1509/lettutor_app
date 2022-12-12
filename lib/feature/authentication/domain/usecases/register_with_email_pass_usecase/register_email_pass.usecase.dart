import 'package:dartz/dartz.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../../enities/login_entity.dart';
import '../../repositories/authentication_repository.dart';
import 'register_email_pass_params.usecase.dart';

class RegisterEmailPassUseCase
    with
        UseCase<RegisterEmailPassUseCaseParams,
            Either<AppException, LoginEntity>> {
  const RegisterEmailPassUseCase({
    required this.authRepo,
  });

  final AuthenticationRepository authRepo;

  @override
  Future<Either<AppException, LoginEntity>> execute(
          RegisterEmailPassUseCaseParams params) =>
      authRepo.registerEmailPassword(params);
}
