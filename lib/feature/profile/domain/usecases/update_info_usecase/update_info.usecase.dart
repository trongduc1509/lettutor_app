import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/profile/domain/repositories/profile_repository.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/user_info_entity.dart';
import 'update_info_params.usecase.dart';

class UpdateInfoUseCase
    with
        UseCase<UpdateInfoUseCaseParams, Either<AppException, UserInfoEntity>> {
  const UpdateInfoUseCase(this._profileRepo);

  final ProfileRepository _profileRepo;

  @override
  Future<Either<AppException, UserInfoEntity>> execute(
          UpdateInfoUseCaseParams params) =>
      _profileRepo.updateUserInfo(params.toJson());
}
