import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/change_pass_entity.dart';
import '../../repositories/profile_repository.dart';
import 'change_pass_params.usecase.dart';

class ChangePassUseCase
    with
        UseCase<ChangePassUseCaseParams,
            Either<AppException, ChangePassEntity>> {
  const ChangePassUseCase(this._profileRepo);

  final ProfileRepository _profileRepo;

  @override
  Future<Either<AppException, ChangePassEntity>> execute(
          ChangePassUseCaseParams params) =>
      _profileRepo.changePassword(params.toJson());
}
