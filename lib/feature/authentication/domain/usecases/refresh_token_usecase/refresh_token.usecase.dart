import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';
import 'package:lettutor_app/feature/user/domain/repositories/user_repository.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../../enities/login_entity.dart';
import 'refresh_token_params.usecase.dart';

class RefreshTokenUseCase
    with UseCase<RefreshTokenUseCaseParams, Either<AppException, LoginEntity>> {
  const RefreshTokenUseCase({
    required this.authRepo,
  });

  final AuthenticationRepository authRepo;

  @override
  Future<Either<AppException, LoginEntity>> execute(
          RefreshTokenUseCaseParams params) =>
      authRepo.refreshToken(params);

  // @override
  // Future<LoginResponse> execute() async {
  //   final response = await _repo.refreshToken();
  //   await _repo.cacheToken(response, _userManager.current!);
  //   if (!LoginSuccess(response).valid()) {
  //     JwtService.inst.userManager.expired();
  //   }
  //   return response;
  // }
}
