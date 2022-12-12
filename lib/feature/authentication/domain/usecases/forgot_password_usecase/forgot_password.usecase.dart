import 'package:dartz/dartz.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/base/define/usecase/usecase.base.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/forgot_pass_entity.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/forgot_password_usecase/forgot_password_params.usecase.dart';

class ForgotPassUseCase
    with
        UseCase<ForgotPassUseCaseParams,
            Either<AppException, ForgotPassEntity>> {
  ForgotPassUseCase({
    required this.authRepo,
  });

  final AuthenticationRepository authRepo;

  @override
  Future<Either<AppException, ForgotPassEntity>> execute(
          ForgotPassUseCaseParams params) =>
      authRepo.forgotPassword(params);
}
